FROM ubuntu:14.04.2
MAINTAINER Luis Davim "luis.davim@smartbox.com"

ENV DEBIAN_FRONTEND noninteractive
# Update the package repository and install applications
RUN apt-get update -qq && \
    apt-get upgrade -yqq && \
    apt-get -yqq install git build-essential automake cmake make g++ gcc gdb gdbserver git libmysqlclient-dev libssl-dev libtool openssl && \
    apt-get -yqq clean

VOLUME /tmp

ADD ./proxysql.cnf.template /opt/
RUN mkdir -p /etc/proxysql
RUN mkdir -p /root/.ssh

COPY ./run.sh ./build.sh /
RUN chmod +x /*.sh

ENV GIT_BRANCH "master"
ENV GIT_REPO "https://github.com/sysown/proxysql.git"

ENV CONF_FILE "/etc/proxysql/proxysql.cnf"
ENV DATA_DIR "/var/run/proxysql"

RUN bash /build.sh

CMD ["/run.sh"]

# Expose ports
EXPOSE 6033
