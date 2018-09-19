FROM phusion/baseimage

RUN apt-get update && \
    apt-get --no-install-recommends --yes install \
         git \
         automake \
         build-essential \
         libtool \
         autotools-dev \
         autoconf \
         pkg-config \
         libssl-dev \ 
         libboost-system-dev  \
         libboost-filesystem-dev  \
         libboost-chrono-dev   \
         libboost-program-options-dev   \
         libboost-test-dev   \
         libboost-thread-dev  \
         libevent-dev \
         bsdmainutils \
         vim \
         software-properties-common && \
         rm -rf /var/lib/apt/lists/* &&\
         apt-get clean

RUN add-apt-repository ppa:bitcoin/bitcoin && \
    apt-get update && \
    apt-get --no-install-recommends --yes install \
          libdb4.8-dev \
          libdb4.8++-dev \
          libminiupnpc-dev && \
          rm -rf /var/lib/apt/lists/*  &&\
          apt-get clean

WORKDIR /goacoin

ENV GOA_VERSION v0.12.2.2
VOLUME ["/root/.goacoin"]

RUN git clone -b master https://github.com/goacoincore/goacoin.git . && \
    git checkout $GOA_VERSION && \
    ./autogen.sh && \
    ./configure && \
    make &&\
    strip /goacoin/src/goacoind /goacoin/src/goacoin-cli && \
    mv /goacoin/src/goacoind /usr/local/bin/ && \
    mv /goacoin/src/goacoin-cli /usr/local/bin/ && \
    # attach log files to
    touch /root/.goacoin/debug.log &&\
    ln -sf /dev/stdout /root/.goacoin/debug.log && \
    # clean
    rm -rf /goacoin 

EXPOSE 1947

CMD ["goacoind","-reindex"]
