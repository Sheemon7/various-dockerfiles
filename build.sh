#!/bin/bash

# e.g. sudo ./build.sh $M1 2018-09-26_all_4_1 latest
if [ "$#" -ne 3 ]; then
    echo "Please supply machine from which to pull model, the model name, and the container tag as an arguments"
    exit 1
fi

cp -r ~/src/ ./mini/data/

scp $1:/home/ubuntu/s3/data/results/$2/training/m.bson ./mini/data/m.bson || exit 1
scp $1:/home/ubuntu/s3/data/results/$2/training/training_norm_consts.jld2 ./mini/data/training_norm_consts.jld2 || exit 1

# # build julia-custom and upload
cd julia-custom
sudo docker build ./ --tag simonmandlik/julia-custom:latest
sudo docker push simonmandlik/julia-custom:latest
# # build mini and upload
cd ../mini
sudo docker build ./ --tag simonmandlik/mini:$3
sudo docker push simonmandlik/mini:$3

# sudo docker run --rm --privileged simonmandlik/mini:baseline hobbiton-eu-west-1-nn docker_test
# or sudo docker run --rm -it --privileged --entrypoint=/bin/bash simonmandlik/mini:baseline hobbiton-eu-west-1-nn docker_test
