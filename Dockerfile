FROM ubuntu:groovy
RUN apt-get update -y
RUN apt-get install -y watchman git make bsdmainutils
WORKDIR /root
