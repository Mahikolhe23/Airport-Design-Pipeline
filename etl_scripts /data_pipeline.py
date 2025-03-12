import pandas as pd

df = pd.read_csv('./datasets/sales_data.csv',encoding='latin-1',sep=',')

orders = df[['QTR_ID','ORDERNUMBER','QUANTITYORDERED','ORDERLINENUMBER','ORDERDATE']]
products = df[['PRODUCTLINE','PRODUCTCODE','PRODUCTCODE']]
customers = df[['CUSTOMERNAME','PHONE','ADDRESSLINE1','ADDRESSLINE2','CITY','STATE','POSTALCODE','COUNTRY','TERRITORY']]
print(df['DEALSIZE'].unique())


