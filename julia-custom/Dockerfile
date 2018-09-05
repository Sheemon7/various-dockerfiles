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
    pdf2svg \
	perl \
	pkg-config \
    poppler-utils \
	python \
	python2.7-dev \
	python3-dev \
	s3fs \
    sudo \
    texlive-latex-base \
	tmux \
	unzip \
	wget \
	zlib1g-dev \
&& apt-get -y autoremove \
&& rm -rf /var/lib/apt/lists/*

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
RUN curl "https://julialang-s3.julialang.org/bin/linux/x64/0.6/julia-$VERSION-linux-x86_64.tar.gz" -o julia.tar.gz
RUN tar -xf julia.tar.gz && rm julia.tar.gz
RUN ln -s /opt/julia-9d11f62bcb/bin/julia /usr/local/bin/julia

# build system image and install dependencies
RUN julia -e 'include(joinpath(dirname(JULIA_HOME),"share","julia","build_sysimg.jl")); build_sysimg(force=true)'
RUN julia -e 'packages = ["Revise", "Flux", "BSON", "Adapt", "MLBase", "Hiccup", "PGFPlotsX", "Conda", "DataStructures", "Query", "MLDataPattern", "PyPlot", "Plots", "GraphPlot", "CSV", "DataFrames", "Gadfly", "Compose", "JLD", "JLD2", "Requests", "TranscodingStreams", "XMLDict", "Retry", "StatsBase", "LearnBase", "FileIO"]; \
Pkg.add.(packages); \
Pkg.clone("https://github.com/pevnak/Mill.jl"); \
Pkg.clone("https://github.com/pevnak/FluxExtensions.jl"); \
Pkg.update(); \
Pkg.build();'

# build s3fs
RUN git clone https://github.com/s3fs-fuse/s3fs-fuse.git
WORKDIR s3fs-fuse
RUN ./autogen.sh && ./configure && make && make install

WORKDIR /root
