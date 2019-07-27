#preproc
def target_encode(df,target,cols,fillna=''):
    df['target'] = target
    for col in cols:
        print('Encoding variable: '+col)
        agged_targ = df.groupby(col).target.sum()
        df[col] = df[col].map(agged_targ)
        if fillna=='mean':
            df[col].fillna(df(col).mean(),inplace=True)
        elif fillna=='median':
            df[col].fillna(df(col).median(),inplace=True)
    return df.drop('target',axis=1)
    
    
#function to downcast data types to 32 bits
def downcast(df):
    float_cols = [col for col in df if df[col].dtype=='float64']
    int_cols = [col for col in df if df[col].dtype=='int64']

    df[float_cols] = df[float_cols].astype(np.float32)
    df[int_cols] = df[int_cols].astype(np.int32)
    
    return(df)