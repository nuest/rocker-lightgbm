# rocker-lightgbm

Add Microsoft's [LightGBM](https://github.com/microsoft/LightGBM) to a [Rocker](https://www.rocker-project.org/) Docker image.

[![](https://img.shields.io/docker/cloud/automated/nuest/rocker-lightgbm)](https://hub.docker.com/r/nuest/rocker-lightgbm "Automated build on Docker Hub")
 [![](https://images.microbadger.com/badges/image/nuest/rocker-lightgbm.svg)](https://microbadger.com/images/nuest/rocker-lightgbm "rocker-lightgbm on microbadger.com")

## About

The image includes Python and installs both the [LightGBM R package](https://github.com/microsoft/LightGBM/tree/master/R-package) and the [LightGBM Python](https://github.com/microsoft/LightGBM/tree/master/python-package) and the LigthGBM CLI.

As the base image we use `rocker/verse` so that the user has RStudio, and we have `git` for the installation.
The installation instructions were taken from the [LightGBM `Dockerfile`s](https://github.com/microsoft/LightGBM/tree/master/docker).

The `Dockerfile` in this repo uses the latest available R version for _demonstration_, though for _production_ and _reproducibility_ workflows should be build on the [version-stable `r-ver` stack of images](https://github.com/rocker-org/rocker-versioned/).

## tl;dr

```bash
docker run --rm -it -e PASSWORD=lightgbm -p 8787:8787 nuest/rocker-lightgbm
```

## Build locally

```bash
docker build --tag rocker-lightgbm .
```

## R Example

```R
daniel@gin-nuest:~/git/rocker-lightgbm$ docker run --rm -it rocker-lightgbm R

R version 3.6.1 (2019-07-05) -- "Action of the Toes"
Copyright (C) 2019 The R Foundation for Statistical Computing
Platform: x86_64-pc-linux-gnu (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

> library(lightgbm)
Loading required package: R6
> data(agaricus.train, package='lightgbm')
> train <- agaricus.train
> dtrain <- lgb.Dataset(train$data, label=train$label)
Loading required package: Matrix
> params <- list(objective="regression", metric="l2")
> model <- lgb.cv(params, dtrain, 10, nfold=5, min_data=1, learning_rate=1, early_stopping_rounds=10)
[LightGBM] [Info] Total Bins 137
[LightGBM] [Info] Number of data: 5211, number of used features: 116
[LightGBM] [Info] Total Bins 137
[LightGBM] [Info] Number of data: 5211, number of used features: 116
[LightGBM] [Info] Total Bins 137
[LightGBM] [Info] Number of data: 5210, number of used features: 116
[LightGBM] [Info] Total Bins 137
[LightGBM] [Info] Number of data: 5210, number of used features: 116
[LightGBM] [Info] Total Bins 137
[LightGBM] [Info] Number of data: 5210, number of used features: 116
[LightGBM] [Info] Start training from score 0.483976
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[LightGBM] [Info] Start training from score 0.482633
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[LightGBM] [Info] Start training from score 0.486180
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[LightGBM] [Info] Start training from score 0.476775
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[LightGBM] [Info] Start training from score 0.480998
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[1]:    valid's l2:0.00030722+0.000614439 
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[2]:    valid's l2:0.00030722+0.000614439 
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[3]:    valid's l2:0.00030722+0.000614439 
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[LightGBM] [Warning] Stopped training because there are no more leaves that meet the split requirements
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[4]:    valid's l2:0.00030722+0.000614439 
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[LightGBM] [Warning] Stopped training because there are no more leaves that meet the split requirements
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[5]:    valid's l2:0.00030722+0.000614439 
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[LightGBM] [Warning] Stopped training because there are no more leaves that meet the split requirements
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[6]:    valid's l2:0.00030722+0.000614439 
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[LightGBM] [Warning] Stopped training because there are no more leaves that meet the split requirements
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[LightGBM] [Warning] Stopped training because there are no more leaves that meet the split requirements
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[7]:    valid's l2:0.00030722+0.000614439 
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[LightGBM] [Warning] Stopped training because there are no more leaves that meet the split requirements
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[LightGBM] [Warning] Stopped training because there are no more leaves that meet the split requirements
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[LightGBM] [Warning] Stopped training because there are no more leaves that meet the split requirements
[8]:    valid's l2:0.00030722+0.000614439 
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[LightGBM] [Warning] Stopped training because there are no more leaves that meet the split requirements
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[LightGBM] [Warning] Stopped training because there are no more leaves that meet the split requirements
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[LightGBM] [Warning] Stopped training because there are no more leaves that meet the split requirements
[9]:    valid's l2:0.00030722+0.000614439 
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[LightGBM] [Warning] Stopped training because there are no more leaves that meet the split requirements
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[LightGBM] [Warning] Stopped training because there are no more leaves that meet the split requirements
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[LightGBM] [Warning] No further splits with positive gain, best gain: -inf
[LightGBM] [Warning] Stopped training because there are no more leaves that meet the split requirements
[10]:   valid's l2:0.00030722+0.000614439 
> model
<lgb.CVBooster>
  Public:
    best_iter: 2
    best_score: -0.000307219662058372
    boosters: list
    initialize: function (x) 
    record_evals: list
    reset_parameter: function (new_params) 
> 
```

## Python

```python
daniel@gin-nuest:~/git/rocker-lightgbm$ docker run --rm -it rocker-lightgbm python
Python 3.7.3 (default, Mar 27 2019, 22:11:17) 
[GCC 7.3.0] :: Anaconda, Inc. on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import lightgbm as lgb
>>> lgb.
lgb.Booster(              lgb.LGBMRanker(           lgb.callback              lgb.dir_path              lgb.os                    lgb.plotting              lgb.sklearn
lgb.Dataset(              lgb.LGBMRegressor(        lgb.compat                lgb.early_stopping(       lgb.plot_importance(      lgb.print_evaluation(     lgb.system(
lgb.LGBMClassifier(       lgb.absolute_import       lgb.create_tree_digraph(  lgb.engine                lgb.plot_metric(          lgb.record_evaluation(    lgb.train(
lgb.LGBMModel(            lgb.basic                 lgb.cv(                   lgb.libpath               lgb.plot_tree(            lgb.reset_parameter(      lgb.warnings
```

## CLI Example

```bash
daniel@gin-nuest:~/git/rocker-lightgbm$ docker run --rm -it rocker-lightgbm /bin/bash
root@f9d36b4f40d4:/# cd /lgbm/LightGBM/examples/binary_classification/
root@f9d36b4f40d4:/lgbm/LightGBM/examples/binary_classification# 
root@f9d36b4f40d4:/lgbm/LightGBM/examples/binary_classification# lightgbm config=train.conf
[LightGBM] [Info] Finished loading parameters
[LightGBM] [Info] Loading weights...
[LightGBM] [Info] Loading weights...
[LightGBM] [Info] Finished loading data in 0.108329 seconds
[LightGBM] [Warning] Starting from the 2.1.2 version, default value for the "boost_from_average" parameter in "binary" objective is true.
This may cause significantly different results comparing to the previous versions of LightGBM.
Try to set boost_from_average=false, if your old models produce bad results
[LightGBM] [Info] Number of positive: 3716, number of negative: 3284
[LightGBM] [Info] Total Bins 6143
[LightGBM] [Info] Number of data: 7000, number of used features: 28
[LightGBM] [Info] Finished initializing training
[LightGBM] [Info] Started training...
[LightGBM] [Info] [binary:BoostFromScore]: pavg=0.530857 -> initscore=0.123586
[LightGBM] [Info] Start training from score 0.123586
[LightGBM] [Info] Iteration:1, training auc : 0.779921
[LightGBM] [Info] Iteration:1, training binary_logloss : 0.667427
[LightGBM] [Info] Iteration:1, valid_1 auc : 0.718121
[LightGBM] [Info] Iteration:1, valid_1 binary_logloss : 0.671716
[LightGBM] [Info] 0.027388 seconds elapsed, finished iteration 1
[LightGBM] [Info] Iteration:2, training auc : 0.801456
[LightGBM] [Info] Iteration:2, training binary_logloss : 0.649324
[LightGBM] [Info] Iteration:2, valid_1 auc : 0.734415
[LightGBM] [Info] Iteration:2, valid_1 binary_logloss : 0.658775
[LightGBM] [Info] 0.084440 seconds elapsed, finished iteration 2
[LightGBM] [Info] Iteration:3, training auc : 0.823854

[...]

[LightGBM] [Info] 5.936735 seconds elapsed, finished iteration 99
[LightGBM] [Info] Iteration:100, training auc : 0.997261
[LightGBM] [Info] Iteration:100, training binary_logloss : 0.223612
[LightGBM] [Info] Iteration:100, valid_1 auc : 0.823642
[LightGBM] [Info] Iteration:100, valid_1 binary_logloss : 0.51086
[LightGBM] [Info] 5.993593 seconds elapsed, finished iteration 100
[LightGBM] [Info] Finished training
root@f9d36b4f40d4:/lgbm/LightGBM/examples/binary_classification# lightgbm config=predict.conf
[LightGBM] [Info] Finished loading parameters
[LightGBM] [Info] Finished initializing prediction, total used 100 iterations
[LightGBM] [Info] Finished prediction
root@f9d36b4f40d4:/lgbm/LightGBM/examples/binary_classification# ls
binary.test  binary.test.weight  binary.train  binary.train.weight  forced_splits.json  LightGBM_model.txt  LightGBM_predict_result.txt  predict.conf  README.md  train.conf
```

## License

Copyright 2019 Daniel Nüst, published under GPL v2.