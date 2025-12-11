
{{ config(materialized='table', schema='SILVER') }}

WITH src AS (
    SELECT 
        SALE_ID,
        CREATED_TS                                       
    FROM {{ ref('bzn_crop_sales_vw') }}
)

SELECT
    SALE_ID AS HK_SALE_ID,
    SALE_ID,
    MIN(CREATED_TS) AS LOAD_TS
FROM src
GROUP BY SALE_ID
