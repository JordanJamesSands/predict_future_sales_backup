preproc_1 <- function(df) {
    merge(items0,item_cats0,by='item_category_id') %>% 
        merge(df,by='item_id') %>% 
        merge(shops0,by='shop_id')
}

preproc_2 <- function(df) {
    df_new <- group_by(df,date_block_num,shop_id,item_id,item_category_id,shop_name,item_name,item_category_name) %>% summarise(sales = sum(item_cnt_day))
    df_new$sales <- ifelse(train2$sales<0,0,train2$sales)
    df_new$sales <- ifelse(train2$sales>20,20,train2$sales)
    df_new
}