#!/bin/bash
# Builds the nodejs module for manylinux. Invoked by ci/build_linux_artifacts_nodejs.sh.
set -e
ARCH=${1:-x86_64}

if [ "$ARCH" = "x86_64" ]; then
    export OPENSSL_LIB_DIR=/usr/local/lib64/
else
    export OPENSSL_LIB_DIR=/usr/local/lib/
fi
export OPENSSL_STATIC=1
export OPENSSL_INCLUDE_DIR=/usr/local/include/openssl

#Alpine doesn't have .bashrc
FILE=$HOME/.bashrc && test -f $FILE && source $FILE
export PATH="$PATH:$HOME/.nvm/node-v18.20.7-linux-x64-glibc-217/bin"
cd nodejs
npm ci
npm run build-release
