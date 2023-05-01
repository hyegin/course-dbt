Project 2

Part 1. Models
Question 1: What is our user repeat rate?
79.84%

with orders_cohort as (
    select
        user_id
        ,count(distinct order_id) as user_orders
    from DEV_DB.DBT_HYEGIN.STG_POSTGRES_ORDERS
    group by 1
)
, users_bucket as (
    select 
        user_id
        ,(user_orders = 1 )::int as has_one_purchases
        ,(user_orders = 2 )::int as has_two_purchases
        ,(user_orders = 3 )::int as has_three_purchases
        ,(user_orders >= 2 )::int as has_two_plus_purchases
    from orders_cohort
)

select 
    sum(has_two_plus_purchases)/ sum ((has_two_plus_purchases + has_one_purchases))
from users_bucket



Question 2: What are good indicators of a user who will likely purchase again? What about indicators of users who are likely NOT to purchase again? If you had more data, what features would you want to look into to answer this question?
Good indicators:
- The user purchased multiple times 
- The user recently purchased and purchased in previous year
- The user is in membership program

Bad indicators:
- The user only purchased once
- The user has no recent purchase
- The use is not in membership program


Question 3: Explain the product mart models you added. Why did you organize the models in the way you did?
- I created a very simple mart with dimension and fact table. This isn't fully complete but I would assume good data mart would have nicely orgnized fact and dimensions inside mart


Part 2. Tests 
- Added test for not null and unique for dimension table
- I would check by looking at last updated time and compare today's date to make sure it's showing freshest data.

Part 3. Snapshot
I did not see any changes here - I may have missed something
