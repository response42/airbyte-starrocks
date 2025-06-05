#!/bin/bash
set -e
set -x

# Get the directory of the current script
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

# need java 17
# https://github.com/StarRocks/starrocks/issues/23714

sudo apt-get install openjdk-17-jdk
sudo update-alternatives --list java
sudo update-alternatives --config java
sudo update-alternatives --list javac
sudo update-alternatives --config javac


java --version
javac --version


# checkout airbyte tag v0.44.4 - corresponds to may 2023 as per https://github.com/StarRocks/starrocks/issues/23714
cd $SCRIPT_DIR/..
git clone git@github.com:airbytehq/airbyte.git
cd $SCRIPT_DIR/../airbyte
git fetch --all --tags --prune
git checkout v0.44.4


############################### 
# attempt 2 - using abctl

# # install abctl
# # https://docs.airbyte.com/platform/using-airbyte/getting-started/oss-quickstart#install-abctl-the-fast-way-mac-linux
# curl -LsfS https://get.airbyte.com | bash -

# # run airbyte 
# # https://docs.airbyte.com/platform/using-airbyte/getting-started/oss-quickstart#part-3-run-airbyte
# abctl local install
# abctl local credentials

# uninstall - if needed
# https://docs.airbyte.com/platform/using-airbyte/getting-started/oss-quickstart#uninstall-airbyte
# abctl local uninstall --persisted
# rm -rf ~/.airbyte/abctl


# # install python 11
# # https://askubuntu.com/questions/1438701/python3-11-package-on-ubuntu-22-04-behind
# sudo add-apt-repository ppa:deadsnakes/ppa
# sudo apt install python3.11

# # install pyenv
# # https://tutorpython.com/downgrade-python-version

# curl https://pyenv.run | bash

# echo 'export PATH="$HOME/.pyenv/bin:$PATH"
# eval "$(pyenv init --path)"
# eval "$(pyenv init -)"' >> ~/.bashrc

# # install abctl-ci
