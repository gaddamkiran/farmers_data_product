
{{ config(materialized='table', schema='SILVER') }}

SELECT
    FARM_ID AS HK_FARM_ID,
    FARMER_ID AS HK_FARMER_ID,
    CURRENT_TIMESTAMP AS LOAD_TS       
FROM {{ ref('bzn_farms_vw') }}