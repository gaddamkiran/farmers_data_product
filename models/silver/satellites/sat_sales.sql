

{{ config(materialized='table', schema='SILVER') }}

SELECT
    SALE_ID AS HK_SALE_ID,
    CROP_NAME,
    QUANTITY_KG,
    SALE_AMOUNT,
    SALE_DATE,
    CREATED_TS AS EFFECTIVE_TS,
    CURRENT_TIMESTAMP AS LOAD_TS
FROM {{ ref('bzn_crop_sales_vw') }}
