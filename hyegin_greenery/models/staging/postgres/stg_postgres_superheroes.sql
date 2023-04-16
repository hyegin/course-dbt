with source as (
    select * from {{source('postgres','superheroes')}}
), renamed_superheroes as (
    select 
        id  
        , name
        , gender
        , eye_color
        , race
        , hair_color
        , height
        , publisher
        , skin_color
        , alignment
        , weight
        , created_at
        , updated_at
    from source
)

select * from renamed_superheroes