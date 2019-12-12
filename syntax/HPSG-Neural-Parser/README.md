# HPSG Neural Parser

Working variant of HPSG Neural Parser, developed by Junru Zhou and Hai Zhao. You can check out their work here:
* [Github](https://github.com/DoodleJZ/HPSG-Neural-Parser)
* [Article](https://arxiv.org/abs/1907.02684)

## Requirements

1. Linux
  - Because of Cython it is nearly impossible to run this code on MacOS
2. Python 3.6 ot higher
3. Before starting, run make inside the EVALB/ directory to compile an evalb executable. This will be called from Python for evaluation.

Python dependencies can be found in [requirements.txt](requirements.txt). It is recommended to run everything inside virtual environment.

## Training

Training can be started with the following command:

```
./run_single.sh
```

Then you will see something like this:

```
Not using CUDA!
Manual seed for pytorch: 56721812
Hyperparameters:
attention_dropout 0.2
bert_do_lower_case True
bert_model 'bert-large-uncased'
bert_transliterate ''
char_lstm_input_dropout 0.2
clip_grad_norm 0.0
const_lada 0.5
d_biaffine 1024
d_char_emb 64
d_ff 2048
d_kv 64
d_label_hidden 250
d_model 1024
dataset 'ptb'
elmo_dropout 0.5
embedding_dropout 0.2
embedding_path 'data/glove.gz'
embedding_type 'glove'
learning_rate 0.0008
learning_rate_warmup_steps 160
max_len_dev 0
max_len_train 0
model_name 'joint_single'
morpho_emb_dropout 0.2
num_heads 8
num_layers 12
pad_left False
partitioned True
punctuation ".``'':,"
relu_dropout 0.2
residual_dropout 0.2
sentence_max_len 300
step_decay True
step_decay_factor 0.5
step_decay_patience 5
tag_emb_dropout 0.2
timing_dropout 0.0
use_bert False
use_bert_only False
use_cat True
use_chars_lstm True
use_elmo False
use_tags True
use_words True
use_xlnet False
word_emb_dropout 0.4
xlnet_do_lower_case False
xlnet_model 'xlnet-large-cased'
Reading dependency parsing data from data/train_dep.txt
Reading dependency parsing data from data/dev_dep.txt
reading data: 10000
reading data: 20000
reading data: 30000
Total number of data: 39832
Loading training trees from data/train_con.txt...
Loaded 39,832 training examples.
Loading development trees from data/dev_con.txt...
Loaded 1,700 development examples.
Processing trees for training...
total wrong head of : train data: is 46
total wrong head of : dev data: is 3
Constructing vocabularies...
Initializing model...
loading embedding: glove from data/glove.gz
oov: 18819
Initializing optimizer...
Training...
This is joint_single
epoch 1 batch 1/160 processed 250 batch-loss 376.0451 grad-norm 515.9416 epoch-elapsed 0h01m21s total-elapsed 0h01m21s
```

You can specify a lot of parameters. Full list can be found in authors' Github.

## Evaluation

In order to evaluate the perfomance of the model you need to have some model and GloVe embeddings.
Trained with default parameters model can be downloaded from [here](https://github.com/svinkapeppa/comp_models_nl/releases/download/v0.0.2/model.pt). Glove embeddings cand be downloaded fron [here](https://github.com/svinkapeppa/comp_models_nl/releases/download/v0.0.2/glove.gz).

Place trained model in `models` folder. Place embeddings in `data` folder.

Evaluation can be started with the following command (snippet without warnings, which actually occur but doesn't affect anything):

```
./test.sh
```

Then you will see something like this (snippet without warnings, which actually occur but doesn't affect anything):

```
Not using CUDA!
Loading model from models/model.pt...
loading embedding: glove from data/glove.gz
oov: 18820
Reading dependency parsing data from data/test_dep.txt
Loading test trees from data/test_con.txt...
Loaded 2,416 test examples.
Parsing test sentences...
test-fscore (Recall=93.64, Precision=93.92, FScore=93.78) test-elapsed 0h01m35s
best test W. Punct: ucorr: 54210, lcorr: 53508, total: 56684, uas: 95.64%, las: 94.40%, ucm: 59.64%, lcm: 50.75%
best test Wo Punct: ucorr: 47943, lcorr: 47241, total: 49893, uas: 96.09%, las: 94.68%, ucm: 62.04%, lcm: 52.69%
best test Root: corr: 2366, total: 2416, acc: 97.93%
============================================================================================================================
```