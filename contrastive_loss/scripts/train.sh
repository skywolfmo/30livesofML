#!/bin/bash

# Author: Taha Bouhsine
# Email: contact@tahabouhsine.com
# Description: 
# This script runs the train.py script for image classification training 
# with predefined or customizable settings.

# Default parameters
learning_rate=0.001
batch_size=128
epochs=100
img_height=224
img_width=224
seed=420
gpu='2'
dataset_path='/home/bouhsi95/contrastive/data/raw/mnist/train' # Path to the dataset directory
test_dataset_path='/home/bouhsi95/contrastive/data/raw/mnist/test' # Path to the test dataset directory
num_img_lim=100000 # Number of images per class
val_split=0.2 # Validation split
n_cross_validation=5 # Number of bins for cross-validation
num_classes=10 # Number of classes
trainable_epochs=0 # Number of epochs before the backbone becomes trainable
project='contrastive_loss_pair'
entity='rowanvisibility'
model_name='dense'
embedding_dim=128

# Activate Environment
conda activate tf
export XLA_FLAGS=--xla_gpu_cuda_data_dir=/usr/lib/cuda
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CONDA_PREFIX/lib/:$CUDNN_PATH/lib
py_path='/home/bouhsi95/contrastive/pair_contrastive/src/train.py'
# Running the training script with parameters
nohup python "$py_path" \
  --learning_rate $learning_rate \
  --batch_size $batch_size \
  --epochs $epochs \
  --dataset_path $dataset_path \
  --img_height $img_height \
  --img_width $img_width \
  --seed $seed \
  --gpu $gpu \
  --test_dataset_path $test_dataset_path \
  --num_img_lim $num_img_lim \
  --val_split $val_split \
  --num_classes $num_classes \
  --trainable_epochs $trainable_epochs \
  --project $project \
  --entity $entity \
  --model_name $model_name \
  --embedding_dim $embedding_dim \
  > train_logs.out

