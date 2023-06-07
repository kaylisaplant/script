#!/bin/bash
#SBATCH --image=kmcbride/paraviewlayer:latest
#SBATCH --qos=debug
#SBATCH -t 00:02:00
#SBATCH -C cpu
#SBATCH -N 1
#SBATCH -o output.o%j
srun ip -4 -f inet addr show hsn0 | awk '/inet / {print $2}' | cut -d/ -f1
srun podman-hpc run ./shft/app/paraview/build/bin/pvserver
