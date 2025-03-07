{% snapshot snapshot_products %}

{{
  config(
    target_database = target.database,
    target_schema = target.schema,
    strategy='check',
    unique_key='product_id',
    check_cols=['inventory'],
   )
}}

WITH base AS(
  SELECT 
    *
  FROM {{ ref('stg_postgres_products') }}
)

SELECT * FROM base

{% endsnapshot %}