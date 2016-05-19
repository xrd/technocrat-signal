#!/usr/bin/env bash

apt-get update

# install openjdk
sudo apt-get install openjdk-7-jdk

# download android sdk
wget http://dl.google.com/android/android-sdk_r24.2-linux.tgz

tar -xvf android-sdk_r24.2-linux.tgz
cd android-sdk-linux/tools

# install all sdk packages, only 4.4.2 API 19.
./android update sdk --no-ui -t 7

# Install NodeJS
apt-get install nodejs npm

# Install tools for hubot

npm install -g hubot coffee-script yo generator-hubot
mkdir -p hubot
cd hubot
yo hubot
npm install hubot-slack --save

HUBOT_SLACK_TOKEN=xoxb-1234-5678-91011-00e4dd ./bin/hubot --adapter slack

# Install Ruby