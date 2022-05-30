#!/bin/sh

set -ex

echo "Defining parameters..." &&
    if [ "${TARGETARCH}" = "arm64" ]; then
        AWSCLI_URL="https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip"
    else
        AWSCLI_URL="https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip"
    fi

echo "Installing tools..." &&
    apt-get update -qq && apt-get install -y wget zip curl &&
    pip install -U pip &&
    pip install pipenv boto3 &&
    apt install -y npm git &&
    echo "Installing tools done !"

echo "Installing awscli2..." &&
    curl ${AWSCLI_URL} -o "awscliv2.zip" &&
    unzip awscliv2.zip &&
    ./aws/install &&
    echo "Installing awscli2 done !"

echo "Installing cloudsploit..." &&
    npm install &&
    ln -s /node_modules/cloudsploit/index.js /usr/local/bin/cloudsploit &&
    echo "Installing cloudsploit done !"
