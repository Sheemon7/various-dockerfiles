#!/bin/bash

sudo s3fs $S3_URL $S3 -o use_cache=/tmp -o -o umask=002 -o use_sse=kmsid:'KMSID'

export JULIA_NUM_THREADS=$(nproc --all)

# julia -L set-paths.jl docker_main.jl
exec "$@"
