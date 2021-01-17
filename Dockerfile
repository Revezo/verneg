FROM ubuntu:latest

RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386 openssh-server net-tools \
    && mkdir /var/run/sshd

COPY src /opt/gothic-server/
COPY bin/G2O_Server /opt/gothic-server
WORKDIR /opt/gothic-server

CMD ["/usr/sbin/sshd", "-D"]