with source as (
    select * from {{source('postgres','order_items')}}
), renamed_order_items as (
    select 
        order_id
        , product_id
        , quantity
    from source
)

select * from renamed_order_items