FROM ubuntu:15.10

MAINTAINER Charles Korn "me@charleskorn.com"

RUN apt-get update
RUN apt-get install curl wget -y
RUN apt-get install openjdk-8-jdk -y
RUN apt-get clean
RUN apt-get autoclean

# Fix SSL certificates
RUN update-ca-certificates -f

RUN wget --output-document=/opt/android-sdk.tgz http://dl.google.com/android/android-sdk_r24.4.1-linux.tgz 
RUN cd /opt && tar xzf android-sdk.tgz 
RUN rm -f /opt/android-sdk.tgz 
RUN chown -R root.root /opt/android-sdk-linux

ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

RUN (while true; do echo 'y'; sleep 2; done) | /opt/android-sdk-linux/tools/android update sdk --all --force --no-ui --filter platform-tools,build-tools-23.0.2,android-23,extra-android-support,extra-android-m2repository,extra-google-m2repository,extra-google-google_play_services
