FROM simonmandlik/julia-custom:latest

LABEL maintainer="simon.mandlik@gmail.com"
ARG REPO=git://github.com/pevnak/Mini.jl.git
ARG REPO_NAME=Mini.jl
ARG S3_URL=hobbiton-eu-west-1-nn
ARG t=""
ARG p=1

# mounted S3 location
ENV S3=/root/s3
ENV S3_URL=$S3_URL
RUN mkdir $S3
# mounting in entrypoint
# RUN sudo s3fs $S3_BUCKET $S3 -o iam_role='auto' -o use_cache="" -o use_sse=kmsid:'alias/NN'

# copy code to $HOME/src
# RUN mkdir /root/$REPO_NAME
# COPY $REPO_NAME/ /root/$REPO_NAME
# WORKDIR /root/$REPO_NAME

# copy model and norm_consts

# ENV JULIA_NUM_THREADS=t
 
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
# CMD ["/bin/bash", "-c", "julia -p $p init.sh"]]
