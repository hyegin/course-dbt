with source as (
    select * from {{source('postgres','events')}}
), renamed_events as (
    select 
        event_id
        , session_id
        , user_id
        , page_url
        , created_at
        , event_type
        , order_id
        , product_id
    from source
)

select * from renamed_events