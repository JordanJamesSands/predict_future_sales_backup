#script to run models on validation set? (maybe do this in python?)
run_validation <- function(master_validation_list,fitmodel,...)
for (vm in names(validation_list)){
    #for month of validation
    X_train <- train_list[[vm]]
    Y_train <- target_train_list[[vm]]
    X_val <- validation_list[[vm]]
    Y_val <- target_validation_list[[vm]]
    
    
    #fit a model
    mod <- fitmodel(X_train,Y_train,...)
    preds <- predict(mod,X_val)
    #compute RMSE on X_val
    rmse(preds,Y_val)
}

rmse <- function(x1,x2) {
    sqrt(mean((x1-x2)^2))
}