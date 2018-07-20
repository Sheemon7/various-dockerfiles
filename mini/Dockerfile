FROM simonmandlik/julia-custom:latest

LABEL maintainer="simon.mandlik@gmail.com"
ARG REPO=git://github.com/pevnak/Mini.jl.git
ARG REPO_NAME=Mini.jl
ARG S3=/s3
ARG S3_BUCKET=hobbiton-eu-west-1-nn
ARG t=""

# mounted S3 location
ENV S3=$S3
ENV S3_BUCKET=$S3_BUCKET
RUN mkdir $S3

RUN mkdir /root/$REPO_NAME
COPY $REPO_NAME/ /root/$REPO_NAME
WORKDIR /root/$REPO_NAME

# ENV JULIA_NUM_THREADS=t

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["tmux"]
