#!/bin/bash

# mount s3
s3fs $1 $S3 -o iam_role='auto' -o use_cache="" -o use_sse=kmsid:'alias/NN'

# build system image
# julia -e 'include(joinpath(dirname(Sys.BINDIR),"share","julia","build_sysimg.jl")); build_sysimg(force=true)'

export JULIA_NUM_THREADS=$(nproc --all)

DATA_FOLDER=$S3/$2/$(cat $S3/$2/data_folder.txt)

julia -L set_paths.jl docker_main.jl $DATA_FOLDER
# julia -L set_paths.jl -e "println(ARGS, Base.Threads.nthreads())" $DATA_FOLDER
