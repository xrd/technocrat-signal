#!/usr/bin/env bash

apt-get update

# install openjdk
sudo apt-get install openjdk-7-jdk

# download android sdk
wget http://dl.google.com/android/android-sdk_r24.2-linux.tgz

tar -xvf android-sdk_r24.2-linux.tgz
cd android-sdk-linux/tools

# install all sdk packages
./android update sdk --no-ui
