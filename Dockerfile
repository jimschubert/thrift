FROM ubuntu:12.04

RUN buildDeps=" \
        flex \
        bison \
        g++ \
        make \
        cmake \
        wget \
        automake \
        "; \
    apt-get update && \
    apt-get -y install --no-install-recommends $buildDeps && \
    apt-get -y install  openjdk-6-jdk && \
    apt-get -y install python-dev php5-dev libboost-test-dev mono-gmcs mono-devel libmono-cil-dev libmono-2.0-1 ruby1.8-dev libcommons-lang-java libevent-dev pkg-config libtool libssl-dev && \
    cd /tmp && \
    wget http://archive.apache.org/dist/incubator/thrift/0.5.0-incubating/thrift-0.5.0.tar.gz && \
    tar zxvf thrift-0.5.0.tar.gz && \
    cd thrift-0.5.0 && \
    ./configure && \
    make && \
    make install && \
    cd / && \
    apt-get purge -y --auto-remove $buildDeps && \
    apt-get clean && \
    rm -rf /tmp/* && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["thrift"]

