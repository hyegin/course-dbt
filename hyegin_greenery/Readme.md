Question 1: 
select count(distinct(user_id)) from DEV_DB.DBT_HYEGIN.STG_POSTGRES_USERS
130 users

Question 2: 
with orders as ( select count(order_id) as order_count from DEV_DB.DBT_HYEGIN.STG_POSTGRES_ORDERS
group by hour(created_at) ) 

select avg(order_count) from orders

15.04 orders per hour

Question 3:
select 
    avg(datediff(day, created_at, delivered_at)) 
from DEV_DB.DBT_HYEGIN.STG_POSTGRES_ORDERS 
where status='delivered';
3.8 days

Question 4: 

with orders as (select
    user_id,
    count(distinct order_id) as purchase
from
DEV_DB.DBT_HYEGIN.STG_POSTGRES_ORDERS
    group by user_id)

SELECT 
    CASE 
    WHEN PURCHASE = 1 THEN '1'
    WHEN PURCHASE = 2 THEN '2'
    WHEN PURCHASE >=3 THEN '3 AND UP'
    END AS GROUPED_PURCHASE_NUM ,
    count(DISTINCT USER_ID) AS NUM_USERS
FROM ORDERS
GROUP BY GROUPED_PURCHASE_NUM
;

1- 25, 2- 27, 3 AND MORE - 71

Question 5: 
with events as (
select
    hour(created_at) as create_hour,
    count(distinct session_id) as sessions
from DEV_DB.DBT_HYEGIN.STG_POSTGRES_EVENTS
    group by hour(created_at))
select avg(sessions) from events
39.45 sessions