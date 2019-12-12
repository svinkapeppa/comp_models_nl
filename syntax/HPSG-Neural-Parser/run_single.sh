#!/usr/bin/env bash
python src_joint/main.py train \
 --model-path-base models/joint_single \
 --epochs 150 \
 --use-chars-lstm \
 --use-words \
 --use-tags \
 --use-cat \
 --const-lada 0.5 \
 --num-layers 12 \
 --dataset ptb \
 --embedding-path data/glove.gz \
 --model-name joint_single \
 --embedding-type glove \
 --checks-per-epoch 4 \
 --train-ptb-path data/train_con.txt \
 --dev-ptb-path data/dev_con.txt \
 --dep-train-ptb-path data/train_dep.txt \
 --dep-dev-ptb-path data/dev_dep.txt