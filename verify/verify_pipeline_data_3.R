x_train_valfold$shop_name <- as.character(x_train_valfold$shop_name)
x_train_valfold$item_name <- as.character(x_train_valfold$item_name)

x_train_testfold$shop_name <- as.character(x_train_testfold$shop_name)
x_train_testfold$item_name <- as.character(x_train_testfold$item_name)

a <- subset(x_train_testfold,date_block_num<33)
all_equal(a,x_train_valfold)

