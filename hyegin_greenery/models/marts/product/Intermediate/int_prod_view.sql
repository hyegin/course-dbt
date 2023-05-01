{{ config(materialized='view') }}

select
    event_id,
    user_id,
    session_id,
    order_id,
    product_id,
    created_at,
    page_url
from {{ ref('stg_postgres_events') }}
    where event_type = 'page_view'  