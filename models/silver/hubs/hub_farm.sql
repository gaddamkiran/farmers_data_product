
{{ config(materialized='table', schema='SILVER') }}

WITH src AS (
    SELECT 
        FARM_ID,
        CREATED_TS
    FROM {{ ref('bzn_farms_vw') }}   
)

SELECT
    FARM_ID AS HK_FARM_ID,
    FARM_ID,
    MIN(CREATED_TS) AS LOAD_TS
FROM src
GROUP BY FARM_ID