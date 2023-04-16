with source as (
    select * from {{source('postgres','promos')}}
), renamed_promos as (
    select 
        promo_id
        , discount
        , status
    from source
)

select * from source