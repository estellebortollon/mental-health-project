with 

source as (

    select * from {{ source('raw', 'major_depression') }}

),

renamed as (

    select
        entity,
        code,
        year,
        major_depression

    from source

)

select * from renamed