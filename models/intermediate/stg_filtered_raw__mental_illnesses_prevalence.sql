with source as (

    select *
    from {{ ref('int_mental_illnesses_prevalence') }}

),

renamed as (

    select
        entity,
        code,
        continent,
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