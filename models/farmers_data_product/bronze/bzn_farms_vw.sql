
{{ config(materialized='view', schema='BRONZE') }}

SELECT
    FARM_ID,
    FARMER_ID,
    AREA_ACRES,
    NULLIF(TRIM(VILLAGE), '') AS VILLAGE,
    NULLIF(TRIM(DISTRICT), '') AS DISTRICT,
    NULLIF(TRIM(STATE), '') AS STATE,
    CREATED_TS
FROM {{ source('bronze', 'BZN_FARMS_RAW') }}