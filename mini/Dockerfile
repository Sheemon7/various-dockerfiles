FROM simonmandlik/julia-custom:latest

LABEL maintainer="simon.mandlik@gmail.com"

# mounted S3 location
ENV S3=/root/s3
RUN mkdir $S3

# copy code, model, settings and norm_consts
COPY data/ /root/

WORKDIR src/

RUN julia -e 'using Pkg; Pkg.activate("."); Pkg.instantiate(); Pkg.update(); Pkg.build()'

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
