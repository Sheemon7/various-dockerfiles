FROM simonmandlik/julia-custom:latest

LABEL maintainer="simon.mandlik@gmail.com"

ARG S3_URL=hobbiton-eu-west-1-nn

# mounted S3 location
ENV S3=/root/s3
ENV S3_URL=$S3_URL
RUN mkdir $S3

# copy code, model, settings and norm_consts
COPY data/* /root/

# copy model and norm_consts

WORKDIR /src

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

# CMD ["/bin/bash", "-c", "julia -p $p init.sh"]]
