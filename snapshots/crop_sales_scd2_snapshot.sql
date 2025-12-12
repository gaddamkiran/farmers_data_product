{% snapshot crop_sales_scd2_snapshot %}

{{ 
    config(
        target_database='ZURIENCH_FARMERS_DB',
        target_schema='SILVER',
        unique_key='SALE_ID',
        strategy='check',
        check_cols=[
            'FARM_ID',
            'CROP_NAME',
            'QUANTITY_KG',
            'SALE_AMOUNT',
            'SALE_DATE'
        ]
    ) 
}}

SELECT
    SALE_ID,
    FARM_ID,
    NULLIF(TRIM(CROP_NAME),'') AS CROP_NAME,
    QUANTITY_KG,
    SALE_AMOUNT,
    SALE_DATE,
    CREATED_TS
FROM ZURIENCH_FARMERS_DB.BRONZE.BZN_CROP_SALES_RAW

{% endsnapshot %}
