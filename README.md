# Cogent Embedded VCPKG Registry

## Overview

Provides forks for open source projects with pull requests that not accepted to mainline (yet).

## List

### nng

NNG library with support of hub protocol for the tweaktool.

Install NNG from custom repo

```
git clone https://github.com/CogentEmbedded/vcpkg.git ce-vcpkg
cd vcpkg
./vcpkg install nng --overlay-ports=../ce-vcpkg/ports/nng
```
