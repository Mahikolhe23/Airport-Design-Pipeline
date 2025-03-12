import requests
import pandas as pd
from io import StringIO
from sqlalchemy import create_engine
import urllib
import config as cg

# SQL Server connection details
server = 'localhost,1433'
database = 'Practise_db'
user = 'SA'
password = 'Mahikolhe@23'
driver = 'ODBC Driver 18 for SQL Server'

# Construct the connection string for SQLAlchemy
params = urllib.parse.quote_plus(f"DRIVER={driver};SERVER={server};DATABASE={database};UID={user};PWD={password};TrustServerCertificate=yes")
engine = create_engine(f"mssql+pyodbc:///?odbc_connect={params}")
conn = engine.connect()

# data read
df = pd.read_csv('./datasets/orders.csv',na_values=['Not Available','unknown'])

# make column format proper use _ and lowercase
df.columns = df.columns.str.lower()
df.columns = df.columns.str.replace(' ','_')

# derive new column discount, sale price and profit
df['discount'] = df['list_price']*df['discount_percent']*.01 

df['sale price'] = df['list_price'] - df['discount']

df['profit'] = df['sale price'] - df['cost_price']

df['order_date'] = pd.to_datetime(df['order_date'],format='%Y-%m-%d')

df.drop(columns=['list_price','discount_percent','cost_price'],inplace=True)

# loading clean data into main tables
df.to_sql('orders',con=conn,if_exists='append',index=False)
print('data load success')


