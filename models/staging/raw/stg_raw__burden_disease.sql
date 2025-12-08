with 

source as (

    select * from {{ source('raw', 'burden_disease') }}

),

renamed as (

    select
        entity,
        code,
        year,
        dalys_depressive_disorders,
        dalys_schizophrenia,
        dalys_bipolar_disorder,
        dalys_eating_disorders,
        dalys_anxiety_disorders

    from source

)

select * from renamed