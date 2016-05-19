## Create Android project

android create project --package com.webiphany.technocratsignal --path android --target 14 --activity TechnocratSignalActivity

## Install gradle (build system tool)

./gradlew init
cp /src/android/build.gradle .
./gradlew 

# Add the manifest file which has the proper permissions in it.
cp /src/android/AndroidManifest.xml .

# Add the code to do the pull from the server
cp /src/android/src/com/webiphany/technocratsignal/MainActivity.java src/com/webiphany/techocratsignal/.

# Review the spinner code and the lights on/off code.

# 

