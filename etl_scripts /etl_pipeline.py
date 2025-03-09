import requests
import pandas as pd
from io import StringIO
from sqlalchemy import create_engine
import urllib
import config as cg

# Fetch Flights Data from github csv
git_raw_url = 'https://raw.githubusercontent.com/Mahikolhe23/sql-data-warehouse-project/refs/heads/main/datasets/source_crm/cust_info.csv'
response = requests.get(git_raw_url)

if response.status_code == 200:
    csv_data = StringIO(response.text)
    df = pd.read_csv(response.text)
    print('Data fetched successfully from GitHub')
else:
    print('Failed to fetch data')

# Fetch Passenger details from API
flight_api_url = "https://www.faa.gov/airports/planning_capacity/passenger_allcargo_stats/"
response = requests.get(flight_api_url)

if response.status_code == 200:
    print('get')
    flight_data = response.text
    print(flight_data)
else:
    print("❌ Failed to fetch flight data")


# SQL Server connection details
server = cg.server
database = cg.database
user = cg.user
password = cg.password
driver = cg.driver

# Construct the connection string for SQLAlchemy
params = urllib.parse.quote_plus(f"DRIVER={driver};SERVER={server};DATABASE={database};UID={user};PWD={password};TrustServerCertificate=yes")
engine = create_engine(f"mssql+pyodbc:///?odbc_connect={params}")

