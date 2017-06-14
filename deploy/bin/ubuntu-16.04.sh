#!/usr/bin/env bash

# yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# node
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs

sudo apt-get apt-get update

sudo apt-get install -y yarn
sudo apt-get install -y libtokyocabinet-dev
sudo apt-get install -y libgmp3-dev
sudo apt-get install -y libmysqlclient-dev
sudo apt-get install -y libpq-dev
sudo apt-get install -y libsqlite3-dev
sudo apt-get install -y libev-dev
