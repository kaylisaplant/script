#!/bin/bash
#SBATCH --qos=debug
#SBATCH --time=30:00
#SBATCH -C cpu
#SBATCH -N 1
#SBATCH -o output.o%j
jq -Rn --arg Ip-is "$(ip -4 -f inet addr show hsn0:chn | awk '/inet / {print $2}' | cut -d/ -f1)" '{"ip": $ARGS.named["Ip-is"]}'> key.json

cp key.json $HOME/key.json
#srun podman-hpc run --net host --rm -it docker.io/kmcbride/paraviewlayer:latest /shft/app/paraview/build/bin/pvserver
srun shifter --image=docker:kmcbride/pvserver:latest /home/nonroot/shft/app/paraview/build/bin/pvserver
