import requests
import pandas as pd
from io import StringIO
from sqlalchemy import create_engine
import urllib

# SQL Server connection details
server = 'localhost,1433'
database = 'airport_data_pipeline'
user = 'SA'
password = 'Mahikolhe@23'
driver = 'ODBC Driver 18 for SQL Server'


# Construct the connection string for SQLAlchemy
params = urllib.parse.quote_plus(f"DRIVER={driver};SERVER={server};DATABASE={database};UID={user};PWD={password};TrustServerCertificate=yes")
engine = create_engine(f"mssql+pyodbc:///?odbc_connect={params}")

# Fetch Flights Data from github csv
git_raw_url = 'https://raw.githubusercontent.com/Mahikolhe23/Airport-Design-Pipeline/refs/heads/main/datasets/Airports2.csv'
response = requests.get(git_raw_url)

if response.status_code == 200:
    csv_data = StringIO(response.text)
    df = pd.read_csv(csv_data,delimiter=",",encoding="utf-8")
    print('Data fetched successfully from GitHub')
else:
    print('Failed to fetch data')

df.to_sql('airport_details',con=engine,if_exists='replace',index=False)
print('data load success')
