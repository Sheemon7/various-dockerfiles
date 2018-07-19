FROM ubuntu

LABEL maintainer="simon.mandlik@gmail.com"

ARG VERSION=0.7.0-beta2
ARG DEBIAN_FRONTEND=noninteractive

# install dependencies, all in a separate command for better caching
RUN apt-get -y clean
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y dist-upgrade

RUN apt-get -y install --no-install-recommends apt-utils
RUN apt-get -y install --no-install-recommends automake make cmake
RUN apt-get -y install --no-install-recommends build-essential
RUN apt-get -y install --no-install-recommends bzip2
RUN apt-get -y install --no-install-recommends ca-certificates
RUN apt-get -y install --no-install-recommends curl wget
RUN apt-get -y install --no-install-recommends gcc g++
RUN apt-get -y install --no-install-recommends gfortran
RUN apt-get -y install --no-install-recommends git
RUN apt-get -y install --no-install-recommends hdf5-tools
RUN apt-get -y install --no-install-recommends htop
RUN apt-get -y install --no-install-recommends libatomic1
RUN apt-get -y install --no-install-recommends libxml2
RUN apt-get -y install --no-install-recommends m4
RUN apt-get -y install --no-install-recommends perl
RUN apt-get -y install --no-install-recommends pkg-config
RUN apt-get -y install --no-install-recommends python python2.7-dev python3-dev
RUN apt-get -y install --no-install-recommends s3fs
RUN apt-get -y install --no-install-recommends tmux
RUN apt-get -y install --no-install-recommends unzip
RUN apt-get -y install --no-install-recommends zlib1g-dev

RUN apt-get -y autoremove

RUN rm -rf /var/lib/apt/lists/*

WORKDIR /opt

# install julia from source
# RUN git clone git://github.com/JuliaLang/julia.git && \
#     cd julia && \
#     git checkout $VERSION
# WORKDIR /opt/julia
# RUN make all -j$(nproc) \
#     MARCH=x86-64 \
#     JULIA_CPU_TARGET=x86-64 && \
#     rm -rf deps/scratch deps/srccache usr-staging
# ENV PATH="/opt/julia/usr/bin:$PATH" \
#     MANPATH="/opt/julia/usr/share/man:$MANPATH"

# download compiled julia
RUN curl "https://julialang-s3.julialang.org/bin/linux/x64/0.7/julia-$VERSION-linux-x86_64.tar.gz" -o julia.tar.gz
RUN tar -xf julia.tar.gz && rm julia.tar.gz
RUN ln -s /opt/julia-$VERSION/bin/julia /usr/local/bin/julia
