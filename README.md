# Cogent Embedded VCPKG Registry

## Overview

Provides forks of open source projects.

## List

### nng

NNG library with support of hub protocol for the tweaktool.

Install NNG from custom repo into system vcpkg installation:

```bash
git clone https://github.com/CogentEmbedded/vcpkg.git ce-vcpkg
cd vcpkg
./vcpkg install nng --overlay-ports=../ce-vcpkg/ports/nng
```
