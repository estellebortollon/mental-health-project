with 

source as (

    select * from {{ source('raw', 'depressive_symptoms') }}

),

renamed as (

    select
        entity,
        code,
        year,
        nearly_every_day,
        more_than_half_the_days,
        several_days

    from source

)

select * from renamed