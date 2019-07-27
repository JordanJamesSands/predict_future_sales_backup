import pandas as pd
import numpy as np
test0py = pd.read_csv('../../original_data/test.csv.gz')
class aggModel:
    
    def __init__(self,agg_len):
        self.agg_len = agg_len
    def fit(self,x_data,y_data):
        max_date_block = max(x_data['date_block_num'])
        x_data['sales'] = y_data
        
        X = x_data[(x_data['date_block_num']<=max_date_block) & (x_data['date_block_num'] > (max_date_block - self.agg_len))]
        
        X = pd.merge(test0py,X,how='left',on=['shop_id','item_id'])
        X = X.fillna(0)
        self.pred = X['sales']
        
    def predict(self,x_data):
        return(self.pred)