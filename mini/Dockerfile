FROM simonmandlik/julia-custom

LABEL maintainer="simon.mandlik@gmail.com"
ARG t=""

# WORKDIR /root/
# COPY juliarc.jl .juliarc.jl
# COPY init.jl .
#
# # mount s3
# # RUN mkdir ./s3 && \
# #		s3fs hobbiton-eu-west-1-nn ./s3 -o iam_role=ec2worker -o use_cache=/tmp -o umask=002 -o use_sse=kmsid:'KMSID'
#
# COPY Project.toml Manifest.toml /root/
# RUN julia --depwarn=no -e "Pkg.activate(\"/root\"); Pkg.instantiate()"
#
# COPY /src/* /root/src/
#
# ENV JULIA_NUM_THREADS=t
#
# WORKDIR /root/src
# #ENTRYPOINT ["/bin/bash", "-c", "julia -L ../init.jl ${*}", "--"]
#
# # docker run -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
