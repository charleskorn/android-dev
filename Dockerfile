FROM ubuntu:15.10

MAINTAINER Charles Korn "me@charleskorn.com"

RUN apt-get update
RUN apt-get install curl wget -y
RUN apt-get install openjdk-8-jdk -y
RUN apt-get clean
RUN apt-get autoclean

RUN wget --output-document=/opt/android-sdk.tgz http://dl.google.com/android/android-sdk_r24.4.1-linux.tgz 
RUN cd /opt && tar xzf android-sdk.tgz 
RUN rm -f /opt/android-sdk.tgz 
RUN chown -R root.root /opt/android-sdk-linux

