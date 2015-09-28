# Android development environment based on Ubuntu 14.04 LTS.
# version 0.0.1

# Start with Ubuntu 14.04 LTS.
FROM phusion/baseimage

MAINTAINER ayvazj <james.ayvaz@gmail.com>

# Never ask for confirmations
ENV DEBIAN_FRONTEND noninteractive
RUN echo "debconf shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
RUN echo "debconf shared/accepted-oracle-license-v1-1 seen true" | debconf-set-selections

# First, install add-apt-repository and bzip2
RUN apt-get update
RUN apt-get -y install software-properties-common python-software-properties bzip2 unzip openssh-client git lib32stdc++6 lib32z1

# Add oracle-jdk7 to repositories
RUN add-apt-repository ppa:webupd8team/java

# Update apt
RUN apt-get update

# Install oracle-jdk7
RUN apt-get -y install oracle-java7-installer

# Install android sdk
RUN wget http://dl.google.com/android/android-sdk_r24.3.4-linux.tgz
RUN tar -xvzf android-sdk_r24.3.4-linux.tgz
RUN mv android-sdk-linux /usr/local/android-sdk
RUN rm android-sdk_r24.3.4-linux.tgz

# Install Android tools
RUN echo y | /usr/local/android-sdk/tools/android update sdk --no-ui --all --filter build-tools-23.0.1,platform-tools-23,android-23
#RUN echo y | /usr/local/android-sdk/tools/android update sdk --filter platform,tool,platform-tool,extra,addon-google_apis-google-19,addon-google_apis_x86-google-19,build-tools-19.1.0 --no-ui -a

# Install Android NDK
#RUN wget http://dl.google.com/android/ndk/android-ndk-r10e-linux-x86_64.bin
#RUN chmod a+x android-ndk-r10e-linux-x86_64.bin
#RUN ./android-ndk-r10e-linux-x86_64.bin
#RUN rm android-ndk-r10e-linux-x86_64.bin

# Install Gradle
RUN wget https://services.gradle.org/distributions/gradle-2.7-bin.zip
RUN unzip gradle-2.7-bin.zip
RUN mv gradle-2.7 /usr/local/gradle
RUN rm gradle-2.7-bin.zip

# Environment variables
ENV ANDROID_HOME /usr/local/android-sdk
ENV ANDROID_SDK_HOME $ANDROID_HOME
ENV ANDROID_NDK_HOME /usr/local/android-ndk
ENV GRADLE_HOME /usr/local/gradle
ENV PATH $PATH:$ANDROID_SDK_HOME/tools
ENV PATH $PATH:$ANDROID_SDK_HOME/platform-tools
ENV PATH $PATH:$ANDROID_NDK_HOME
ENV PATH $PATH:$GRADLE_HOME/bin

# Export JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-7-oracle

