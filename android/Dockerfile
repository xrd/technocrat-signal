# Thank you: FROM wasabeef/android
# wasabeef <dadadada.chop@gmail.com>

FROM ubuntu

RUN apt-get update

RUN apt-get install -y openjdk-8-jdk
RUN apt-get install -y curl

# Install Android SDK
WORKDIR /usr/local/
RUN curl -L http://dl.google.com/android/android-sdk_r24.2-linux.tgz -o android.tgz 
RUN ls *.tgz
RUN tar xzf android.tgz

# Install Android tools
RUN echo y | /usr/local/android-sdk-linux/tools/android update sdk --filter tools --no-ui --force -a
RUN echo y | /usr/local/android-sdk-linux/tools/android update sdk --filter platform-tools --no-ui --force -a

# Install Gradle
RUN curl -L  https://services.gradle.org/distributions/gradle-2.13-bin.zip -o gradle.zip
RUN apt-get install -y unzip
RUN unzip -o gradle.zip

# Environment variables
ENV ANDROID_HOME /usr/local/android-sdk-linux
ENV GRADLE_HOME /usr/local/gradle-2.13
ENV PATH $PATH:$ANDROID_HOME/tools
ENV PATH $PATH:$ANDROID_HOME/platform-tools
ENV PATH $PATH:$GRADLE_HOME/bin
ENV PATH $PATH:/usr/local/android-utils
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/

# Clean up
RUN rm -rf /usr/local/android.tgz

RUN apt-get install -y ruby # Use ruby for the creation script
RUN echo y | /usr/local/android-sdk-linux/tools/android update sdk --no-ui -t android-19 --force -a
RUN echo y | /usr/local/android-sdk-linux/tools/android update sdk --no-ui -t build-tools-23.0.1 --force -a

# Need to install 32 bit for android tools like aapt and adb
RUN apt-get -y install gcc-multilib lib32z1 lib32stdc++6

# Trying to get this to build and cache files (and eventually daemonize...)
# WORKDIR /src/foobar
# RUN gradle tasks
# RUN gradle assembleDebug --info

