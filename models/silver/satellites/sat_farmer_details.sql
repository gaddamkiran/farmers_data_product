
{{ config(materialized='table', schema='SILVER') }}

SELECT
    FARMER_ID AS HK_FARMER_ID,
    FARMER_NAME,
    AGE,
    PHONE,
    STATE,
    UPDATED_TS AS EFFECTIVE_TS,
    CURRENT_TIMESTAMP AS LOAD_TS
FROM {{ ref('bzn_farmers_vw') }}
