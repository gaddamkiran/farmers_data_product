
{{ config(materialized='view', schema='BRONZE') }}


SELECT
    FARMER_ID,
    TRIM(FARMER_NAME) AS FARMER_NAME,
    AGE,
    NULLIF(TRIM(PHONE), '') AS PHONE,
    NULLIF(TRIM(STATE), '') AS STATE,
    CREATED_TS,
    UPDATED_TS
FROM {{ source('bronze', 'BZN_FARMERS_RAW') }}