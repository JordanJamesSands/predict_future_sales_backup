train1_verify = group_by(train0,date_block_num,shop_id,item_id) %>% summarise(item_cnt_month=sum(item_cnt_day))

train2_verify = merge(train1_verify,shops0,by='shop_id',all.x=TRUE) %>% 
    merge(items0,by='item_id',all.x=TRUE) %>%
    merge(item_cats0,by='item_category_id',all.x=TRUE)

#clip values
train2_verify$item_cnt_month <- ifelse(train2_verify$item_cnt_month>20,20,train2_verify$item_cnt_month)
train2_verify$item_cnt_month <- ifelse(train2_verify$item_cnt_month<0,0,train2_verify$item_cnt_month)

train2$item_name = as.character(train2$item_name)
train2_verify$item_name = as.character(train2_verify$item_name)