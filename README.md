# **Airport Data Pipeline**

## **📌 Overview**
The **Airport Data Pipeline** project is designed to ingest, process, and store airport-related data efficiently. It fetches raw data from multiple sources (e.g., APIs, CSV files), transforms it using ETL scripts, and loads it into a structured database. The processed data can then be used for analytics and reporting.

## **📂 Project Structure**
```
📂 Airport-Data-Pipeline
│── 📂 datasets         # Raw and processed data
│── 📂 sql_scripts      # SQL scripts for table creation and data processing
│── 📂 etl_scripts      # Python scripts for ETL pipeline
│── 📜 README.md        # Project overview and documentation
│── 📜 requirements.txt # Python dependencies
```

## **🔹 Features**
✅ Fetches data from external sources (APIs, CSVs)  
✅ Cleans and transforms data using **Python & Pandas**  
✅ Loads structured data into **SQL Server**  
✅ Automates the ETL pipeline  

---
## **⚙️ Technologies Used**
- **Python** (ETL scripting)
- **Pandas** (Data manipulation)
- **SQL Server** (Database)
- **SQLAlchemy** (Database connection)
- **ODBC Driver 18** (For SQL Server connectivity)
- **Azure Data Studio** (SQL management)

---
## **📦 Setup & Installation**
### **1️⃣ Install Dependencies**
Make sure you have Python installed, then install required libraries:
```bash
pip install -r requirements.txt
```

### **2️⃣ Setup SQL Server**
Ensure SQL Server is running, and create the database:
```sql
CREATE DATABASE airport_db;
```
Run the **SQL scripts** from `sql_scripts/` to create tables.

### **3️⃣ Configure Database Connection**
Edit the `config.py` file (if available) with your SQL Server details:
```python
DB_CONFIG = {
    'server': 'localhost,1433',
    'database': 'airport_db',
    'user': 'SA',
    'password': 'YourPassword',
    'driver': 'ODBC Driver 18 for SQL Server'
}
```

---
## **🔄 ETL Pipeline Execution**
### **1️⃣ Fetch Data from API / CSV**
```bash
python etl_scripts/extract.py
```

### **2️⃣ Transform Data**
```bash
python etl_scripts/transform.py
```

### **3️⃣ Load Data into SQL Server**
```bash
python etl_scripts/load.py
```

Or run the entire ETL process in one step:
```bash
python etl_scripts/main.py
```

---
## **📊 Data Sources**
- **FAA Passenger Data:** [FAA Website](https://www.faa.gov/airports/planning_capacity/passenger_allcargo_stats/)
- **Kaggle Datasets:** [Kaggle](https://www.kaggle.com/)

---
## **🚀 Future Improvements**
- Implement **Airflow** for ETL scheduling
- Optimize SQL queries for faster execution
- Deploy on **Cloud (Azure/AWS)**

---
## **📜 License**
This project is **open-source** and free to use.

### **👨‍💻 Author: Mahendra Kolhe**

