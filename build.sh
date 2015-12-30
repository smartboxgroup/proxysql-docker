#!/bin/bash
set -e

# Logic for pulling the app and starting it
GIT_HOST=$(echo $GIT_REPO | sed -n 's/.*\@\(.*\)\/.*/\1/p')
echo "Host ${GIT_HOST}\n\tStrictHostKeyChecking no\n" >> /root/.ssh/config
cd /opt/
# try to remove the repo if it already exists
rm -rf proxysql; true
echo "Pulling proxysql source from $GIT_BRANCH"
git clone -b $GIT_BRANCH $GIT_REPO proxysql
cd proxysql
make clean && make
install -m 0755 src/proxysql /usr/local/bin
install -m 0600 etc/proxysql.cnf /etc
install -m 0755 etc/init.d/proxysql /etc/init.d
if [ ! -d /var/run/proxysql ]; then mkdir /var/run/proxysql ; fi
cd .. && rm -rf proxysql
