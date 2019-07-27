#install catboost
devtools::install_url('https://github.com/catboost/catboost/releases/download/v0.6.1.1/catboost-R-Windows-0.6.1.1.tgz')



library(catboost)
train_pool <- catboost.load_pool(data=train1,label=)