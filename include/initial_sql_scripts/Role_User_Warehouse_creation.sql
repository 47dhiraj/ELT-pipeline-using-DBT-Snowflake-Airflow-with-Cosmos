

-- ***** Using Security Administration role to do following things  *****

USE ROLE SECURITYADMIN;

-- Creating new System Administrator role "dbt_DEV_ROLE"
CREATE OR REPLACE ROLE dbt_DEV_ROLE COMMENT='dbt_DEV_ROLE';
GRANT ROLE dbt_DEV_ROLE TO ROLE SYSADMIN;

-- Creating new user 'dbt_USER'
CREATE OR REPLACE USER dbt_USER PASSWORD='<PASSWORD>'
DEFAULT_ROLE=dbt_DEV_ROLE
DEFAULT_WAREHOUSE=dbt_WH
COMMENT='dbt User';

-- Granting dbt_DEV_ROLE role to dbt_USER
GRANT ROLE dbt_DEV_ROLE TO USER dbt_USER;



-- *****Using ACCOUNTADMIN role to give privileges/permission to new create 'dbt_DEV_ROLE'*****
USE ROLE ACCOUNTADMIN;

GRANT CREATE DATABASE ON ACCOUNT TO ROLE dbt_DEV_ROLE;



-- Creating a Virtual DBT developement warehouse to use, using system administrator role

-- ***** Using ACCOUNTADMIN role *****
USE ROLE SYSADMIN;


CREATE OR REPLACE WAREHOUSE dbt_DEV_WH
    WITH WAREHOUSE_SIZE = 'XSMALL'
    AUTO_SUSPEND = 120
    AUTO_RESUME = true
    INITIALLY_SUSPENDED = TRUE;


GRANT ALL ON WAREHOUSE dbt_DEV_WH TO ROLE dbt_DEV_ROLE;
