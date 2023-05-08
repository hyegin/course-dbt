{{ config( materialised = 'table' )}}

WITH events AS (
  SELECT * FROM {{ ref('stg_postgres_events') }}
)
, order_items AS (
  SELECT * FROM {{ ref('stg_postgres_order_items') }}
)
, orders AS (
  SELECT * FROM {{ ref('stg_postgres_orders') }}
)
, 
product_pv_atc AS (
      SELECT product_id
            ,COUNT(DISTINCT CASE WHEN event_type = 'page_view' THEN session_id ELSE null END) distinct_product_page_view_sessions
            ,COUNT(DISTINCT CASE WHEN event_type = 'add_to_cart' THEN session_id ELSE null END) distinct_product_add_to_cart_sessions
      FROM  events
      GROUP BY product_id
  )
, product_checkout AS (
      SELECT oi.product_id
            ,COUNT(DISTINCT e.session_id) distinct_product_checkout_sessions
      FROM events e
      INNER JOIN orders o ON o.order_id = e.order_id AND e.event_type = 'checkout'
      INNER JOIN order_items oi ON oi.order_id = o.order_id
      GROUP BY oi.product_id
  )

  SELECT COALESCE(pc.product_id, ppa.product_id) AS product_id
        ,distinct_product_page_view_sessions
        ,distinct_product_add_to_cart_sessions
        ,distinct_product_checkout_sessions
  FROM product_checkout pc
  LEFT JOIN product_pv_atc ppa ON pc.product_id = ppa.product_id

