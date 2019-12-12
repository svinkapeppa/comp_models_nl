#!/usr/bin/env bash
python src_joint/main.py test \
--dataset ptb \
--consttest-ptb-path data/test_con.txt \
--deptest-ptb-path data/test_dep.txt \
--embedding-path data/glove.gz \
--model-path-base models/model.pt
