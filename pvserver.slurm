#!/bin/bash
#SBATCH --qos=debug
#SBATCH --time=30:00
#SBATCH -C cpu
#SBATCH -N 1
#SBATCH -o output.o%j
jq -Rn --arg Ip-is "$(ip -4 -f inet addr show hsnb0:chn | awk '/inet / {print $2}' | cut -d/ -f1)" '{"ip": $ARGS.named["Ip-is"]}'> key.json

cp key.json $HOME/key.json
# podman-hpc run --net host --rm --expose 11111 -it docker.io/kmcbride/paraviewlayer:latest /shft/app/paraview/build/bin/pvserver --hostname 0.0.0.0
shifter --image=docker:kmcbride/pvserver:latest /home/nonroot/shft/app/paraview/build/bin/pvserver --hostname 0.0.0.0
