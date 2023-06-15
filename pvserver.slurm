#!/bin/bash
#SBATCH --qos=debug
#SBATCH --time=20:00
#SBATCH -C cpu
#SBATCH -N 1
#SBATCH -o output.o%j
ip -4 -f inet addr show hsn0 | jq --raw-input --slurp 'split("\n") | map(capture("^(?:(?<broadcast>broadcast) ?)?(?:(?<local>local) ?)?(?:(?<multicast>multicast) ?)?(?: ?(?<network>.*?) )(?:from (?<from>\\S+) ?)?(?:via (?<via>\\S+) ?)?(?:dev (?<dev>\\S+) ?)?(?:table (?<table>\\S+) ?)?(?:proto (?<proto>\\S+) ?)?(?:scope (?<scope>\\S+) ?)?(?:src (?<src>\\S+) ?)?(?:metric (?<metric>\\d+) ?)?(?<linkdown>linkdown)?(?<unresolved>unresolved)?"; "g"))'
srun podman-hpc run --rm -it docker.io/kmcbride/paraviewlayer:latest /shft/app/paraview/build/bin/pvserver

