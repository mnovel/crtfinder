# crtfinder

**crtfinder** is a simple script tool designed to extract all subdomains from the crt.sh website.

## Overview

**crtfinder** leverages crt.sh, a certificate transparency search engine, to quickly retrieve and list subdomains associated with a specified domain. It provides a convenient command-line interface for extracting subdomains either directly from a domain, a list of domains, or a file containing domain names.

## Installation

```bash
$ git clone https://github.com/mnovel/crtfinder
$ cd crtfinder
$ chmod +x crtfinder.sh
$ sudo mv crtfinder.sh /usr/local/bin/crtfinder
```

## Running crtfinder

```bash
$ crtfinder -h
```

Invalid option.
```bash
Usage: crtfinder [OPTIONS]
Options:
  -d DOMAIN  : Specify a domain to retrieve subdomains
  -f FILE    : Specify a file containing a list of domains
  -help      : Display this help message
```

### Examples

#### Extract subdomains from a single domain

```bash
$ crtfinder -d google.com
```

**Example Result:**
```bash
aarjav-b480g7k2ab9@checkout.google.com
accounts.flexpack.google.com
accounts.freezone.google.com
...
```

#### Extract subdomains from a file containing domain names

```bash
$ cat domain.txt | crtfinder
```

**Example Result:**
```bash
aarjav-b480g7k2ab9@checkout.google.com
accounts.flexpack.google.com
accounts.freezone.google.com
...
```

#### Extract subdomains from a specified domain

```bash
$ crtfinder -d google.com
```

**Example Result:**
```bash
aarjav-b480g7k2ab9@checkout.google.com
accounts.flexpack.google.com
accounts.freezone.google.com
...
```

#### Extract subdomains from a file containing domain names

```bash
$ crtfinder -f domain.txt
```

**Example Result:**
```bash
aarjav-b480g7k2ab9@checkout.google.com
accounts.flexpack.google.com
accounts.freezone.google.com
...
```

## Author

[Muhammad Novel]
