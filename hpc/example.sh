#!/bin/bash

#SBATCH --job-name=spminer
#SBATCH --output=logs/%x-%j.out
#SBATCH -A st_graphs
#SBATCH -p shared_dlt
#SBATCH -n 1
#SBATCH --ntasks-per-node=4
#SBATCH --gres=gpu:1
#SBATCH -t 3-23:59:00

module purge
module load cuda/9.2.148 
#module load cuda/10.1.243
module load python/anaconda3.2019.3
#module load gcc/4.4.7
#module load gcc/4.8.5
module load gcc/5.2.0
source /share/apps/python/anaconda3.2019.3/etc/profile.d/conda.sh
#source /share/apps/python/anaconda3.2019.3/etc/profile.d/conda.sh
source activate spminer

echo "CUDA_VISIBLE_DEVICES: ${CUDA_VISISBLE_DEVICES}"
dataset=example
printf "Running SP Miner on dataset=${dataset}\n"
date

# Code location
REPO_DIR=~/neural-subgraph-learning-GNN


printf "Going to REPO_DIR=${REPO_DIR}\n"
cd $REPO_DIR

python -m subgraph_matching.train

printf "Finished\n"
date
