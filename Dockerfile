FROM ubuntu:22.04

RUN apt update && apt install -y openssh-server
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN mkdir /var/run/sshd
RUN useradd -m -s /bin/bash user
RUN echo "user:secret" | chpasswd

EXPOSE 22

# Uncomment for run with another service
#ENTRYPOINT service ssh start && bash

CMD ["/usr/sbin/sshd", "-D"]
