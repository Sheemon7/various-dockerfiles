FROM ubuntu

LABEL maintainer="simon.mandlik@gmail.com"

ARG VERSION=0.6.4
ARG DEBIAN_FRONTEND=noninteractive

# install dependencies
RUN apt-get -y clean && apt-get -y update && \
    apt-get -y install --no-install-recommends \
    apt-utils \
    automake \
    autotools-dev \
    build-essential \
    bzip2 \
    ca-certificates \
    cmake \
    curl \
    fuse \
    g++ \
    gcc \
    gettext \
    gfortran \
    git \
    hdf5-tools \
    htop \
    libatomic1 \
    libcurl4-openssl-dev \
    libfuse-dev \
    libssl-dev \
    libxml2-dev \
    m4 \
    make \
    perl \
    pkg-config \
    sudo \
    unzip \
    wget \
    zlib1g-dev \
&& apt-get -y autoremove \
&& rm -rf /var/lib/apt/lists/*

WORKDIR /opt

# download compiled julia
RUN curl "https://julialang-s3.julialang.org/bin/linux/x64/1.0/julia-1.0.1-linux-x86_64.tar.gz" -o julia.tar.gz
RUN tar -xf julia.tar.gz && rm julia.tar.gz
RUN ln -s /opt/julia-1.0.1/bin/julia /usr/local/bin/julia

# build s3fs
RUN git clone https://github.com/s3fs-fuse/s3fs-fuse.git
WORKDIR s3fs-fuse
RUN ./autogen.sh && ./configure && make && make install

WORKDIR /root
