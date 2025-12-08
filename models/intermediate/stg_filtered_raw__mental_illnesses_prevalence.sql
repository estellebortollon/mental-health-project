with 

source as (

    select * from {{ source('raw', 'mental_illnesses_prevalence') }}

),

renamed as (

    select
        entity,
        code,
        year,
        schizophrenia_disorders,
        depressive_disorders,
        anxiety_disorders,
        bipolar_disorders,
        eating_disorders

    from source
    where code is not null

)

select * from renamed