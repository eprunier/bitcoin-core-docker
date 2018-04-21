FROM fedora:27

ARG btc_version=0.16.0
ARG cc_cores=1

RUN dnf -y install gcc-c++ libtool make autoconf automake openssl-devel libevent-devel boost-devel libdb4-devel libdb4-cxx-devel python3 git which

# Optional
# RUN dnf -y install miniupnpc-devel qt5-qttools-devel qt5-qtbase-devel protobuf-devel qrencode-devel

WORKDIR /usr/src

RUN git clone https://github.com/bitcoin/bitcoin.git \
  && cd ./bitcoin \
  && git checkout v${btc_version}

WORKDIR /usr/src/bitcoin

RUN ./autogen.sh \
  && ./configure \
  && make -j ${cc_cores}

RUN make check && make install

ENTRYPOINT [ "bitcoind", "-conf=/root/.bitcoin/bitcoin.conf", "-printtoconsole" ]
CMD [ ]
