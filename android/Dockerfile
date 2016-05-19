# Thank you: FROM wasabeef/android
# wasabeef <dadadada.chop@gmail.com>

FROM ubuntu

RUN apt-get update

RUN apt-get install -y openjdk-9-jre
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
# ENV GRADLE_HOME /usr/local/gradle-1
ENV PATH $PATH:$ANDROID_HOME/tools
ENV PATH $PATH:$ANDROID_HOME/platform-tools
ENV PATH $PATH:$GRADLE_HOME/bin

# Clean up
RUN rm -rf /usr/local/android.tgz

