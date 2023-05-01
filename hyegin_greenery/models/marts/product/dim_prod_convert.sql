{{ config(materialized='table') }}

with view_events as (
  select product_id, 
  count(distinct session_id) as view_sessions 
  from {{ ref('int_prod_view') }}
  group by 1
),

checkout_events as (
  select product_id,
  product_name,
  count(session_id) as checkout_sessions 
  from {{ ref('int_prod_checkout' ) }}
  group by 1,2
)

select 
    c.product_name,
    ((c.checkout_sessions / v.view_sessions)*100) as convert_rate
from checkout_events as c, view_events as v
where c.product_id = v.product_id