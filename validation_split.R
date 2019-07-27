#doing validation myself
hist(train3$date_block_num)
INITIAL_END <- 20
#train for first 20 months initially, validate on next month, then train 21 months etc.

train_list <- list()
validation_list <- list()
target_train_list <- list()
target_validation_list <- list()

for(final_train_month in (INITIAL_END):(33-1)) {
    train_bool <- train3$date_block_num<=final_train_month
    validation_bool <- train3$date_block_num==(final_train_month+1)
    
    train_list[[length(train_list)+1]] <- train_bool
    validation_list[[length(validation_list)+1]] <- validation_bool
    target_train_list[[length(target_train_list)+1]] <- target3[train_bool]
    target_validation_list[[length(target_validation_list)+1]] <- target3[validation_bool]
    
}
names(validation_list) <- (INITIAL_END+1):33
names(train_list) <- (INITIAL_END+1):33
names(target_train_list) <- (INITIAL_END+1):33
names(target_validation_list) <- (INITIAL_END+1):33

master_validation_scheme <- list(train_list,target_train_list,validation_list,target_validation_list)
