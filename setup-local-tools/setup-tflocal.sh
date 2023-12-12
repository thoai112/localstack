#!/bin/bash

function check_tflocal() {
    which tflocal
    if [ $? -ne 0 ]; then
        echo "tflocal is not installed. Please install it first."
    else
        echo "tflocal is already installed."
        exit 0
    fi
}

function install_tflocal() {
    pip install terraform-local
    tflocal --version
    if [ $? -ne 0 ]; then
        echo "tflocal is not installed. Please install it first."
    fi
    exit 0
}

function main() {
    check_tflocal
    install_tflocal
}

main
