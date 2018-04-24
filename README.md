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
3. Set the environment variable for your localhost IP (if different than `127.0.0.1`)
    - `export LOCAL_IP=127.0.0.1`
4. Run `docker-compose up` or `docker-compose up -d` to daemonize it
5. Check that everything is running smoothly with `docker-compose ps`

**You're done!** (at least for local port 3000).

* <a href="https://localhost">https://localhost</a> &rightarrow; <a href="http://localhost:3000">http://localhost:3000</a>
    * useful for something like [Create React App](https://github.com/facebook/create-react-app)!

If you want to proxy another port (say 3001), update the `proxy.conf` file and run `docker-compose down && docker-compose up`.

## License

This free and open source software is licensed under the [MIT License](LICENSE).

```text
MIT License

Copyright (c) 2018 Udia Software Incorporated

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```