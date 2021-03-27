FROM ubuntu:groovy
RUN apt-get update -y
RUN apt-get install -y watchman git make bsdmainutils ssh-client busybox
COPY bashrc /root/.bashrc
COPY git-config /root/.gitconfig
WORKDIR /root
ENTRYPOINT ["./autorun.sh"]
