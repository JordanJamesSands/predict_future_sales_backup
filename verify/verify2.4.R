hist_item_sales = d$historical_item_sales
sum=0
for (i in 1:12) {

  col = paste0('sum_item_sales_back_',i)
  print(col)
  sum = sum + d[[col]]
}
all(sum==d$historical_item_sales)