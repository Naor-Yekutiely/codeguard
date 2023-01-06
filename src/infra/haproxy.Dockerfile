FROM haproxytech/haproxy-ubuntu:2.0

EXPOSE 80 8404

COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg