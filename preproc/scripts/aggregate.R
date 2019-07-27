#a <- group_by(train1,date_block_num,shop_id,item_id) %>% summarise(sales = sum(item_cnt_day))
#group all data other than item_cnt_day and item_price

library(dplyr)
train1 <- read.csv('gen_data/train1.csv')

train2.1 <- group_by(train1,date_block_num,shop_id,item_id,item_category_id,shop_name,item_name,item_category_name) %>% summarise(item_cnt_month = sum(item_cnt_day))


write.csv(train2.1,'gen_data/train2.1.csv',row.names=FALSE)




