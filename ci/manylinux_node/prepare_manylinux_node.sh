#!/bin/bash
set -e

install_node() {
    echo "Installing node..."

    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

    source "$HOME"/.bashrc

    if [[ $1 == x86_64* ]]; then
        curl -LO https://unofficial-builds.nodejs.org/download/release/v18.20.7/node-v18.20.7-linux-x64-glibc-217.tar.gz
        tar -xvf node-v18.20.7-linux-x64-glibc-217.tar.gz -C /usr/local
    else
        # gnu target
        nvm install --no-progress 18
    fi


}

install_rust() {
    echo "Installing rust..."
    curl https://sh.rustup.rs -sSf | bash -s -- -y
    export PATH="$PATH:/root/.cargo/bin:/usr/local/node-v18.20.7-linux-x64-glibc-217/bin"
}

install_node
install_rust