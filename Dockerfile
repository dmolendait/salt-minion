FROM alpine:3.15
RUN apk upgrade --no-cache && apk add --no-cache salt-minion=3004-r0 py3-pip=20.3.4-r1 python3-dev=3.9.13-r1 postgresql12-client=12.12-r0 gcc=10.3.1_git20211027-r0 mariadb-connector-c-dev=3.1.13-r2 \
    musl-dev=1.2.2-r7 \
    postgresql12-dev=12.12-r0 \
    gnupg=2.2.31-r2 \
  && pip3 install --no-cache-dir --no-compile mysqlclient postgres \
  && apk del \
    py-pip \
    python3-dev \
    gcc \
    musl-dev \
    postgresql-dev \
  && rm -rf /var/cache/* \
  && rm -rf /root/.cache/* \
  && find /usr/lib/ -name '__pycache__' | xargs -I {} rm -rf {};

RUN mkdir -p /etc/salt/minion.d /etc/salt/pki
CMD ["/usr/bin/salt-minion", "2>", "/dev/null"]
