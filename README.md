# Docker HTTPS Now

Helper docker-compose project for reverse proxying HTTP to HTTPS using a self signed cert.

## Prerequisites

- [Docker](https://docs.docker.com/install/)
- [Openssl](https://www.openssl.org/source/)
- [Make](https://www.gnu.org/software/make/)

Tested with:

```bash
uname -a
# Darwin Alexanders-MacBook-Pro.local 16.7.0 Darwin Kernel Version 16.7.0: Tue Jan 30 11:27:06 PST 2018; root:xnu-3789.73.11~1/RELEASE_X86_64 x86_64

docker --version
# Docker version 18.03.0-ce, build 0520e24

openssl version
# OpenSSL 0.9.8zh 14 Jan 2016

make --version
# GNU Make 3.81
# Copyright (C) 2006  Free Software Foundation, Inc.
# This is free software; see the source for copying conditions.
# There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A
# PARTICULAR PURPOSE.

# This program built for i386-apple-darwin11.3.0
```

## Get Started

1. Run `make all`
2. Install the newly generated certificate authority on your machine.
    - **For macOSX**, open `Application/Utilities/Keychain Access.app`
        - `File > Import Items` and choose the created `ssl/localhostCA.pem`
        - Double click `localhost` and set Trust to `Always Trust`
4. Run `docker-compose up` or `docker-compose up -d` to daemonize it
5. Check that everything is running smoothly with `docker-compose ps`

**You're done!** (at least for local port 3000).

* <a href="https://localhost">https://localhost</a> &rightarrow; <a href="http://localhost:3000">http://localhost:3000</a>
    * useful for something like [Create React App](https://github.com/facebook/create-react-app)!

If you want to proxy another port (say 3001), update the `proxy.conf` file and run `docker-compose down && docker-compose up`.
