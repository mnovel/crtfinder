#!/bin/bash

is_valid_domain() {
  local domain="$1"

  [[ "$domain" =~ ^www\. ]] && domain="${domain#www\.}"

  if [[ "$domain" =~ ^[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.([a-zA-Z]{2,}|xn--[a-zA-Z0-9]+)$ ]]; then
    return 0 
  else
    return 1  
  fi
}

display_help() {
  echo "Usage: $0 [OPTIONS]"
  echo "Options:"
  echo "  -d DOMAIN  : Specify a domain to retrieve subdomains"
  echo "  -f FILE    : Specify a file containing a list of domains"
  echo "  -help      : Display this help message"
  exit 0
}

process_input() {
  local input=$1
  local response=$(curl -s "https://crt.sh/?q=%.$input&output=json")
  local subdomains=$(echo "$response" | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u)
  echo "$subdomains"
}

if ! [ -t 0 ]; then 
  while IFS= read -r line; do
    if is_valid_domain "$line"; then
      process_input "$line"
    else
      echo "Input pada baris \"$line\" bukan domain yang valid."
    fi
  done
elif [ "$#" -gt 0 ]; then  
  while [ "$#" -gt 0 ]; do
    case "$1" in
      -d)
        shift
        if [ -n "$1" ] && is_valid_domain "$1"; then
          process_input "$1"
        else
          echo "Input bukan domain yang valid."
          exit 1
        fi
        ;;
      -f)
        shift
        if [ -n "$1" ] && [ -f "$1" ]; then
          while IFS= read -r line; do
            if is_valid_domain "$line"; then
              process_input "$line"
            else
              echo "Input pada baris \"$line\" bukan domain yang valid."
            fi
          done < "$1"
        else
          echo "File tidak ditemukan atau tidak valid."
          exit 1
        fi
        ;;
      -help)
        display_help
        ;;
      *)
        echo "Pilihan tidak valid."
        display_help
        ;;
    esac
    shift
  done
else  
  display_help
fi
