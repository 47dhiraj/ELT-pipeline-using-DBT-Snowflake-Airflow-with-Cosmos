
-- Create a Database
CREATE OR REPLACE DATABASE DEMO_dbt;


-- create bookings_1 table
CREATE OR REPLACE TABLE bookings_1 (
    id INTEGER,
    booking_reference INTEGER,
    hotel STRING,
    booking_date DATE,
    cost INTEGER
);


-- create bookings_2 table
CREATE OR REPLACE TABLE bookings_2 (
    id INTEGER,
    booking_reference INTEGER,
    hotel STRING,
    booking_date DATE,
    cost INTEGER
);


-- create customers table
CREATE OR REPLACE TABLE customers (
    id INTEGER,
    first_name STRING,
    last_name STRING,
    birthdate DATE,
    membership_no INTEGER
);
