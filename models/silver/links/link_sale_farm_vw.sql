
{{ config(materialized='table', schema='SILVER') }}

SELECT
    SALE_ID AS HK_SALE_ID,
    FARM_ID AS HK_FARM_ID,
    CURRENT_TIMESTAMP AS LOAD_TS
FROM {{ ref('bzn_crop_sales_vw') }}
