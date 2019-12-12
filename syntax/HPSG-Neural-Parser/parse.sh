#!/usr/bin/env bash
python src_joint/main.py parse \
--dataset ptb \
--save-per-sentences 1000 \
--eval-batch-size 50 \
--input-path input_s.txt \
--output-path-synconst output_synconst.txt \
--output-path-syndep output_syndephead.txt \
--output-path-synlabel output_syndeplabel.txt \
--embedding-path data/glove.gz \
--model-path-base models/model.pt
