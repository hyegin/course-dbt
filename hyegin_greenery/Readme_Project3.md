Project 3

Part 1: Create new models to answer the first two questions (answer questions in README file)

A. What is our overall conversion rate?
with events as (
select
    count(case when total_checkout > 0 then session_id else null end) as checkout_sessions
    ,count(session_id) as total_sessions 
from DEV_DB.DBT_HYEGIN.INT_PRODUCT_SESSION
)
select
(checkout_sessions / total_sessions)*100 as overall_conversion_rate
from events

62.46%

B. What is our conversion rate by product?
PRODUCT_NAME	CONVERT_RATE
Orchid	45.3333
Ponytail Palm	40
Pink Anthurium	41.8919
Bamboo	53.7313
Spider Plant	47.4576
Birds Nest Fern	42.3077
Pothos	34.4262
Dragon Tree	46.7742
Alocasia Polly	41.1765
Calathea Makoyana	50.9434
String of pearls	60.9375
Boston Fern	41.2698
Ficus	42.6471
Pilea Peperomioides	47.4576
Jade Plant	47.8261
Aloe Vera	49.2308
Majesty Palm	49.2537
Cactus	54.5455
Angel Wings Begonia	39.3443
Philodendron	48.3871
Arrow Head	55.5556
Monstera	51.0204
Rubber Plant	51.8519
Devil's Ivy	48.8889
ZZ Plant	53.9683
Fiddle Leaf Fig	50
Money Tree	46.4286
Bird of Paradise	45
Peace Lily	40.9091
Snake Plant	39.726


Part 2: We’re getting really excited about dbt macros after learning more about them and want to apply them to improve our dbt project
Macro events per type has been created

Part 3: We’re starting to think about granting permissions to our dbt models in our snowflake database so that other roles can have access to them.


Part 4:  After learning about dbt packages, we want to try one out and apply some macros or tests.
Using dbt utils

Part 5: After improving our project with all the things that we have learned about dbt, we want to show off our work!
attached dbt dags

Part 6: Snapshot
Pothos, Bamboo, Philodendron, Monstera, String of pearls, ZZ Plant have been updated