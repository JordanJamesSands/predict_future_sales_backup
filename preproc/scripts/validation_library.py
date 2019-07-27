import numpy as np
import pandas as pd

def rmse(x1,x2):
    return(np.sqrt(np.mean((x1-x2)**2)))

def dropstrings(df):
    return(df.drop(['item_name','item_category_name','shop_name'],axis=1))

def custom_validation(model,x_train_list,y_train_list,x_val_list,y_val_list,**kwargs):
    n_folds = len(x_train_list)
    #assuming all lists are same length
    loss_list=[]
    for i in range(n_folds):
        
        #max_month = str(x_train_list[i]['date_block_num'].max())
        #min_month = str(x_train_list[i]['date_block_num'].min())
        #print('date block num range in train is '+min_month+' to '+max_month)
        
        
        model.fit(dropstrings(x_train_list[i]),y_train_list[i],**kwargs)
#        preds = model.predict(dropstrings(x_val_list[i]))
        preds = model.predict(x_val_list[i])

        
        y_vals = pd.Series(y_val_list[i],dtype=np.float32)
        preds = pd.Series(preds,dtype=np.float32)
        loss = np.sqrt(np.mean((preds - y_vals)**2))
        loss_list.append(loss)
    return(loss_list)
def create_submission(model,x_train,y_train,x_test,file_loc='',**kwargs):
    model.fit(dropstrings(x_train),y_train,**kwargs)
    preds = pd.DataFrame(model.predict(x_test))
    x_test['item_cnt_month'] = preds
    x_test = x_test.drop(['item_id','shop_id'],axis=1)
    if file_loc:
        
        print('writing file to '+file_loc)
        x_test.to_csv(file_loc,index=False)
    return(x_test)
    