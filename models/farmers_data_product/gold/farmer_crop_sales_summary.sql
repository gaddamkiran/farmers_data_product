
{{ config(materialized='table', schema='GOLD') }}

SELECT
    f.HK_FARMER_ID,
    s.CROP_NAME,
    SUM(s.QUANTITY_KG) AS TOTAL_KG,
    SUM(s.SALE_AMOUNT) AS TOTAL_SALES
FROM {{ ref('sat_sales') }} s
JOIN {{ ref('link_sale_farm_vw') }} lf ON s.HK_SALE_ID = lf.HK_SALE_ID
JOIN {{ ref('link_farm_farmer') }} lff ON lf.HK_FARM_ID = lff.HK_FARM_ID
JOIN {{ ref('sat_farmer_details') }} f ON lff.HK_FARMER_ID = f.HK_FARMER_ID
GROUP BY 1,2
