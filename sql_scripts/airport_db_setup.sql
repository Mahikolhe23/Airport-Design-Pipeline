USE airport_data_pipeline
GO

CREATE TABLE airports(
    airport_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(50),
    latitude DECIMAL(10,6),
    longitude DECIMAL(10,6)
)
GO

CREATE TABLE flights(
    flight_id INT PRIMARY KEY,
    flight_number VARCHAR(10),
    departure_airport VARCHAR(10),
    arrival_airport VARCHAR(10),
    schedule_departure DATETIME,
    schedule_arrival DATETIME,
    actual_departtuere DATETIME NULL,
    actual_arrival DATETIME NULL,
    status VARCHAR(50)
)
GO

CREATE TABLE passengers (
    passenger_id INT PRIMARY KEY,
    flight_id INT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    nationality VARCHAR(100),
    seat_number VARCHAR(10),
    passport_number VARCHAR(20),
    FOREIGN KEY (flight_id) REFERENCES flights(flight_id)
)
GO

CREATE TABLE sensor_data (
    sensor_id INT PRIMARY KEY,
    airport_id INT,
    sensor_type VARCHAR(100),
    recorded_time DATETIME,
    value DECIMAL(10,2),
    unit VARCHAR(10),
    FOREIGN KEY (airport_id) REFERENCES airports(airport_id)
)
GO

CREATE TABLE weather (
    weather_id INT PRIMARY KEY,
    airport_id INT,
    observation_time DATETIME,
    temperature DECIMAL(5,2),
    humidity INT,
    wind_speed DECIMAL(5,2),
    wind_direction VARCHAR(10),
    precipitation DECIMAL(5,2),
    FOREIGN KEY (airport_id) REFERENCES airports(airport_id)
)
GO



