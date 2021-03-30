FROM ubuntu:groovy-minimal
ENV EMAIL=watchman-git@container
ENV GIT_AUTHOR_NAME=watchman-git@container
RUN apt-get update -y
RUN apt-get install -y watchman git ssh-client
WORKDIR /root
COPY bashrc /root/.bashrc
ENTRYPOINT ["./autorun.sh"]

