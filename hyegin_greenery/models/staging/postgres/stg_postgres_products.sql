with source as (
    select * from {{source('postgres','products')}}
), renamed_products as (
    select 
        product_id
        , name
        , price
        , inventory
    from source
)

select * from renamed_products