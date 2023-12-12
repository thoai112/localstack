#!/bin/bash

function check_awslocal() {
    which awslocal
    if [ $? -ne 0 ]; then
        echo "awslocal is not installed. Please install it first."
    else
        echo "awslocal is already installed."
        exit 0
    fi
}

function install_awslocal() {
    pip install awscli-local
    awslocal --version
    if [ $? -ne 0 ]; then
        echo "awslocal is not installed. Please install it first."
    fi
    exit 0
}

function main() {
    check_awslocal
    install_awslocal
}

main
