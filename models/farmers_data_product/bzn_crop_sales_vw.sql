

{{ config(materialized='view', schema='BRONZE') }}

SELECT
    SALE_ID,
    FARM_ID,
    NULLIF(TRIM(CROP_NAME), '') AS CROP_NAME,
    QUANTITY_KG,
    SALE_AMOUNT,
    SALE_DATE,
    CREATED_TS
FROM {{ source('bronze', 'BZN_CROP_SALES_RAW') }}