FROM zenoss/centos:centos7
MAINTAINER Zenoss, Inc <dev@zenoss.com>
RUN yum install -y gcc libmemcached-devel python-devel
RUN yum install -y tar gunzip zlib-devel
ADD https://pypi.python.org/packages/source/p/pylibmc/pylibmc-1.3.0.tar.gz /
RUN tar xvfz pylibmc-1.3.0.tar.gz
RUN cd pylibmc-1.3.0 && python setup.py build
RUN tar cvfz pythonlib-mc-1.3.0-centos7-x86_64.tgz /pylibmc-1.3.0

