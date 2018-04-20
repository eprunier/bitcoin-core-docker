FROM fedora:27

ARG http_proxy
ARG https_proxy

RUN dnf -y install gcc-c++ libtool make autoconf automake openssl-devel libevent-devel boost-devel libdb4-devel libdb4-cxx-devel python3 miniupnpc-devel qt5-qttools-devel qt5-qtbase-devel protobuf-devel qrencode-devel git which

WORKDIR /usr/src

RUN git clone https://github.com/bitcoin/bitcoin.git \
  && cd ./bitcoin \
  && git checkout v0.16.0

WORKDIR /usr/src/bitcoin

RUN ./autogen.sh \
  && ./configure \
  && make

RUN make check && make install
