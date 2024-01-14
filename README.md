# crtfinder
Simple script tool to extract all subdomains from crt.sh website. 

## Installation
```bash
$ git clone https://github.com/mnovel/crtfinder
$ cd crtfinder
$ chmod +x crtfinder.sh
$ sudo mv crtfinder.sh /usr/local/bin/crtfinder
```

## Running crtfinder
```bash
┌──(linux㉿linux)-[~/home/linux]
└─$ crtfinder -h
Invalid option.
Usage: ./crt.sh [OPTIONS]
Options:
  -d DOMAIN  : Specify a domain to retrieve subdomains
  -f FILE    : Specify a file containing a list of domains
  -help      : Display this help message
```
```bash
┌──(linux㉿linux)-[~/home/linux]
└─$ echo google.com | crtfinder
aarjav-b480g7k2ab9@checkout.google.com
accounts.flexpack.google.com
accounts.freezone.google.com
....
```
```bash
┌──(linux㉿linux)-[~/home/linux]
└─$ cat domain.txt | crtfinder
aarjav-b480g7k2ab9@checkout.google.com
accounts.flexpack.google.com
accounts.freezone.google.com
....
```
```bash
┌──(linux㉿linux)-[~/home/linux]
└─$ crtfinder -d google.com
aarjav-b480g7k2ab9@checkout.google.com
accounts.flexpack.google.com
accounts.freezone.google.com
....
```
```bash
┌──(linux㉿linux)-[~/home/linux]
└─$ crtfinder -f domain.txt
aarjav-b480g7k2ab9@checkout.google.com
accounts.flexpack.google.com
accounts.freezone.google.com
....
```
