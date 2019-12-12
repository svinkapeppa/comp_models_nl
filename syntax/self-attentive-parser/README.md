# Self-attentive parser

Working variant of self-attentive parser, developed by Nikita Kitaev and Dan Klein. You can check out their work here:
* [Github](https://github.com/nikitakit/self-attentive-parser)
* [Article](https://arxiv.org/abs/1805.01052)

## Requirements

1. Linux
  - Because of Cython it is nearly impossible to run this code on MacOS
2. Python 3.6 ot higher

Python dependencies can be found in [requirements.txt](requirements.txt). It is recommended to run everything inside virtual environment.

## Training

Training can be started with the following comand:

```
python src/main.py train --use-words --use-chars-lstm --model-path-base models/model --d-char-emb 64
```

Then you will see something like this:

```
Not using CUDA!
Manual seed for pytorch: 1356261206
Hyperparameters:
attention_dropout 0.2
bert_do_lower_case True
bert_model 'bert-base-uncased'
bert_transliterate ''
char_lstm_input_dropout 0.2
clip_grad_norm 0.0
d_char_emb 64
d_ff 2048
d_kv 64
d_label_hidden 250
d_model 1024
d_tag_hidden 250
elmo_dropout 0.5
embedding_dropout 0.0
learning_rate 0.0008
learning_rate_warmup_steps 160
max_consecutive_decays 3
max_len_dev 0
max_len_train 0
morpho_emb_dropout 0.2
num_heads 8
num_layers 8
num_layers_position_only 0
partitioned True
predict_tags False
relu_dropout 0.1
residual_dropout 0.2
sentence_max_len 300
step_decay True
step_decay_factor 0.5
step_decay_patience 5
tag_emb_dropout 0.2
tag_loss_scale 5.0
timing_dropout 0.0
use_bert False
use_bert_only False
use_chars_lstm True
use_elmo False
use_tags False
use_words True
word_emb_dropout 0.4
Loading training trees from data/train_con.txt...
Loaded 39,832 training examples.
Loading development trees from data/dev_con.txt...
Loaded 1,700 development examples.
Processing trees for training...
Constructing vocabularies...
Initializing model...
Initializing optimizer...
Training...
epoch 1 batch 1/160 processed 250 batch-loss 96.8234 grad-norm 102.0791 epoch-elapsed 0h00m56s total-elapsed 0h00m56s
```

You can specify a lot of parameters. Full list can be found in authors' Github.

## Evaluation

In order to evaluate the perfomance of the model you need to have some model. You can specify the path to your model with
`--model-path-base` argument. Trained with default parameters model can be downloaded from [here](https://github.com/svinkapeppa/comp_models_nl/releases/download/v0.0.1/model.pt).

Evaluation can be started with the following comand:

```
python src/main.py test --model-path-base models/model.pt
```

Then you will see something like this:

```
Not using CUDA!
Loading test trees from data/test_con.txt...
Loaded 2,416 test examples.
Loading model from models/model.pt...
Parsing test sentences...
test-fscore (Recall=93.20, Precision=93.90, FScore=93.55, CompleteMatch=47.31) test-elapsed 0h01m06s
```
