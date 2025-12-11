


{{ config(materialized='table', schema='SILVER') }}

SELECT
    FARM_ID AS HK_FARM_ID,
    AREA_ACRES,
    VILLAGE,
    DISTRICT,
    STATE,
    CREATED_TS AS EFFECTIVE_TS,            
    CURRENT_TIMESTAMP AS LOAD_TS
FROM {{ ref('bzn_farms_vw') }}