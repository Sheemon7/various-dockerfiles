#/bin/bash

# build julia-custom and upload
cd julia-custom
sudo docker build ./ --tag simonmandlik/julia-custom:latest
sudo docker push simonmandlik/julia-custom:latest
cd ../mini
sudo docker build ./ --tag simonmandlik/mini:latest
sudo docker push simonmandlik/mini:latest





