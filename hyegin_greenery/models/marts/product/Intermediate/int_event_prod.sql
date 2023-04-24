{{ config(materialized='table') }}

SELECT 
    CAST(EVENT.CREATED_AT AS DATE) AS DATE
    , EVENT.PRODUCT_ID AS PRODUCT_ID
    , PROD.NAME AS PRODUCT_NAME
    , EVENT.EVENT_TYPE as EVENT_TYPE
    , EVENT.EVENT_ID AS EVENT_ID
FROM
    {{ ref('stg_postgres_events') }} AS EVENT
LEFT JOIN 
   {{ ref('stg_postgres_products') }} AS PROD
