library(dplyr)
train2.1 <- read.csv('gen_data/train2.1.csv')


train2 <- train2.1
train2$item_cnt_month <- ifelse(train2$item_cnt_month<0,0,train2$item_cnt_month)
train2$item_cnt_month <- ifelse(train2$item_cnt_month>20,20,train2$item_cnt_month)

write.csv(train2,'gen_data/train2.csv',row.names = FALSE)