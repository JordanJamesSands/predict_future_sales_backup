library(ggplot2)
#check for a leak by comparing item/shop combos with other features
tmp_test0 <- test0
tmp_test0$itemshop <- interaction(test0$shop_id,test0$item_id,sep=':')
tmp_train2 <- train2
tmp_train2$itemshop <- interaction(train2$shop_id,train2$item_id,sep=':')

tmp_train2$is_in_test <- (tmp_train2$itemshop %in% tmp_test0$itemshop)

SAMPLE_NUM <- 100
tmp_train2_small <- tmp_train2[sample(1:nrow(tmp_train2),SAMPLE_NUM),]
tmp_train2_agg <- group_by(tmp_train2,itemshop,is_in_test) %>% summarise(mean_itemshop_sales = mean(sales))
tmp_train2_agg$log_mean_itemshop_sales <- log(tmp_train2_agg$mean_itemshop_sales)

#plots, #make many to check for a relationship between is_in_test and any other feature
g <- ggplot(data=tmp_train2_agg,aes(x=log_mean_itemshop_sales))
print(
    g + geom_histogram() + facet_grid(is_in_test~.)
)
print(
    g + geom_density() + facet_grid(is_in_test~.)
)
print(
    g + geom_histogram(aes(color=is_in_test))
)
print(
    g + geom_density(aes(color=is_in_test))
)
#g <- ggplot(data=tmp_train2_agg,aes(x=itemshop,y=mean_itemshop_sales))
#(g + geom_point(aes(color=is_in_test))) %>% print
#try a correlation plot






#m <- merge(tmp_train2,tmp_test0,by='itemshop')
#tmp_test0_small <- tmp_test0 %>% head(10)

