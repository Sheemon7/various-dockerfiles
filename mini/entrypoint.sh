#!/bin/bash

sudo s3fs $BUCKET $S3 -o use_cache=/tmp -o umask=002 -o use_sse=kmsid:'KMSID'

export JULIA_NUM_THREADS=$(nproc --all)

julia -L set_paths.jl docker_main.jl "$(cat ${S3}/${BUCKET_PATH}/data_folder.txt)"
