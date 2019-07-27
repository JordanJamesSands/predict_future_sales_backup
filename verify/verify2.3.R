library(dplyr)
d$item_cnt_month = y_train_1$item_cnt_month

summed <- group_by(d,item_id) %>%  summarise(agged = sum(item_cnt_month))
summed = summed[order(-summed$agged),]


s <- select(d,item_id,historical_item_sales,item_cnt_month)

s = s[order(s$item_id),]

head(s)

#notice that in summed item_id is not equal to agged
cor(summed$item_id,summed$agged)
#theyre correlated tho