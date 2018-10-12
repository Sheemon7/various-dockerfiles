#!/bin/bash
if [ "$#" -ne 2 ]; then
    echo "Please supply result folder as an argument"
    exit 1
fi

cp -r ~/src/ ./mini/data/

scp $1:/home/ubuntu/s3/data/results/$2/training/m.bson ./mini/data/m.bson || exit 1
scp $1:/home/ubuntu/s3/data/results/$2/training/training_norm_consts.jld2 ./mini/data/training_norm_consts.jld2 || exit 1

# build julia-custom and upload
cd julia-custom
sudo docker build ./ --tag simonmandlik/julia-custom:latest
sudo docker push simonmandlik/julia-custom:latest
# build mini and upload
cd ../mini
sudo docker build ./ --tag simonmandlik/mini:baseline
sudo docker push simonmandlik/mini:baseline

# sudo docker run --rm --privileged simonmandlik/mini:latest
