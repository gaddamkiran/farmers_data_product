
{{ config(materialized='table', schema='SILVER') }}  
WITH src AS (
    SELECT 
        FARMER_ID,
        CREATED_TS
    FROM {{ ref('bzn_farmers_vw') }}
)

SELECT 
    FARMER_ID AS HK_FARMER_ID,             
    FARMER_ID,
    MIN(CREATED_TS) AS LOAD_TS
FROM src
GROUP BY FARMER_ID