library(dplyr)
train1 <- read.csv('gen_data/train1.csv',stringsAsFactors = FALSE,encoding = "utf-8",nrows=10)
print(unique(train1$shop_name),encoding = "utf-8")
d1 <- select(train1,shop_id,item_id,item_category_id,date,date_block_num,item_price,item_cnt_day)


items = unique(train1$item_id)
shops = unique(train1$shop_id)
item_cats = unique(train1$item_category_id)

table(train1$shop_id,train1$shop_name)



