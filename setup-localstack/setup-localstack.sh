#!/bin/bash

# Function to check if LocalStack is installed
function install_localstack() {
    which localstack
    if [ $? -ne 0 ]; then
        echo "LocalStack is not installed. Please install it first."
        pip install pyopenssl -U
        pip install localstack
    fi
}

# Function to check if Docker is installed and running
function check_docker_installed_and_running() {
    which docker
    if [ $? -ne 0 ]; then
        echo "Docker is not installed. Please install it first."
        exit 1
    fi

    # Check if Docker daemon is running
    docker_state=$(systemctl is-active docker)
    if [ "$docker_state" != "active" ]; then
        echo "Docker is not running. Please start it first."
        exit 1
    fi
}

# Function to start LocalStack
function start_localstack() {
    echo "Starting LocalStack..."

    if [ "$USE_PRO" = true ]; then
        docker pull localstack/localstack-pro:"$IMAGE_TAG"
        CONFIGURATION="$CONFIGURATION DNS_ADDRESS=0"
    else
        docker pull localstack/localstack:"$IMAGE_TAG"
    fi

    # Start LocalStack
    eval "${CONFIGURATION} localstack config show"
    eval "${CONFIGURATION} localstack start -d"
    localstack wait -t 60

    if [ $? -ne 0 ]; then
        echo "Failed to start LocalStack."
        exit 1
    fi

    echo "LocalStack started successfully!"
}

# Main script
function main() {
    install_localstack
    check_docker_installed_and_running
    start_localstack
}

main
