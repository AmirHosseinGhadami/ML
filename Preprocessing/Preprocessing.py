import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder , Normalizer



def importing_data(direction):
    try:
        dataset = pd.read_csv(str(direction)+'.csv')
    except:
        print('You Direction Is Wrong')
    return dataset

def normalizing_data(dataset):
    norm = Normalizer ().fit(dataset)
    dataset_norm = norm.transform(dataset)
    dataset_n = pd.DataFrame(dataset_norm ,index=dataset.index ,columns=dataset.columns)
    return dataset_n

def encoding_data(data):
    col = data.columns
    for i in col:
        if data[i].dtype == 'object':
            le = LabelEncoder().fit(data[i])
            data[i] = le.transform(data[i])
    return data

def splitting_data(data,test_size):
    X = data.iloc[:,:-1].values
    y = data.iloc[:,-1 ].values
    x_train,x_test,y_train,y_test = train_test_split(X ,y ,test_size=test_size ,random_state=1)
    return x_train,x_test,y_train,y_test


def prepro_data(direction,test_size):
    dataset = importing_data(direction)
    dataset_encod = encoding_data(dataset)
    dataset_norm = normalizing_data(dataset_encod)
    x_train,x_test,y_train,y_test=splitting_data(dataset_norm,test_size=0.2)

    return x_train,x_test,y_train,y_test
