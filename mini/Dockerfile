FROM simonmandlik/julia-custom:latest

LABEL maintainer="simon.mandlik@gmail.com"

# directory in which the file with data folder will be present
ARG bucket="hobbiton-eu-west-1-nn"
ARG bucket_path="docker_test/"

# mounted S3 location
ENV S3=/root/s3
RUN mkdir $S3
ENV BUCKET=$bucket
ENV BUCKET_PATH=$bucket_path

# copy code, model, settings and norm_consts
COPY data/ /root/

# TODO vyresit toto (bezpecnost)?
RUN mv credentials ~/.passwd-s3fs
RUN chmod 600 ~/.passwd-s3fs

WORKDIR src/

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
