#!/bin/bash
#SBATCH --qos=debug
#SBATCH --time=20:00
#SBATCH -C cpu
#SBATCH -N 1
#SBATCH -o output.o%j
ip -4 -f inet addr show hsn0 | awk '/inet / {print $2}' | cut -d/ -f1
srun podman-hpc run --rm -it docker.io/kmcbride/paraviewlayer:latest /shft/app/paraview/build/bin/pvserver

