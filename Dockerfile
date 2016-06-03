FROM centos:latest
MAINTAINER christian.brugger@doubleslash.de

ENV SQUID_CACHE_DIR=/var/spool/squid \
    SQUID_LOG_DIR=/var/log/squid \
    SQUID_USER=squid 

RUN yum -y update && yum -y install squid which

COPY squid.conf /etc/squid/squid.conf

EXPOSE 3128/tcp

VOLUME ["${SQUID_CACHE_DIR}"]

CMD ["squid", "-f", "/etc/squid/squid.conf", "-NYCd", "1"]
