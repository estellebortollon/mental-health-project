with 

source as (

    select * from {{ source('raw', 'adult_population_covered') }}

),

renamed as (

    select
        entity,
        code,
        year,
        major_depression,
        bipolar_disorder,
        eating_disorders,
        dysthymia,
        schizophrenia,
        anxiety_disorders

    from source

)

select * from renamed