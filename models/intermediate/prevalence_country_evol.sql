-- Calule le total et les évolutions en point de pourcentage par pays de la prévalence

with source as (

    select *
    from {{ ref('int_mental_illnesses_prevalence') }}

),

base as (

    select
        entity,
        code,
        continent,
        year,
        schizophrenia_disorders,
        depressive_disorders,
        anxiety_disorders,
        bipolar_disorders,
        eating_disorders,

        -- total prevalence
        schizophrenia_disorders
        + depressive_disorders
        + anxiety_disorders
        + bipolar_disorders
        + eating_disorders as total_disorders

    from source

),

final as (

    select
        entity,
        code,
        continent,
        year,

        round(schizophrenia_disorders, 4) as schizophrenia_disorders,
        round(
            schizophrenia_disorders - lag(schizophrenia_disorders) over (
                partition by entity order by year
            ),
            4
        ) as schizophrenia_pp_change,

        round(depressive_disorders, 4) as depressive_disorders,
        round(
            depressive_disorders - lag(depressive_disorders) over (
                partition by entity order by year
            ),
            4
        ) as depressive_pp_change,

        round(anxiety_disorders, 4) as anxiety_disorders,
        round(
            anxiety_disorders - lag(anxiety_disorders) over (
                partition by entity order by year
            ),
            4
        ) as anxiety_pp_change,

        round(bipolar_disorders, 4) as bipolar_disorders,
        round(
            bipolar_disorders - lag(bipolar_disorders) over (
                partition by entity order by year
            ),
            4
        ) as bipolar_pp_change,

        round(eating_disorders, 4) as eating_disorders,
        round(
            eating_disorders - lag(eating_disorders) over (
                partition by entity order by year
            ),
            4
        ) as eating_pp_change,

        round(total_disorders, 4) as total_disorders,
        round(
            total_disorders - lag(total_disorders) over (
                partition by entity order by year
            ),
            4
        ) as total_pp_change

    from base

)

select *
from final
where code is not null
order by entity, year
