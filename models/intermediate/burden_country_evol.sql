--Calcul total, et évolution en % du burden (DALYS) par trouble et par pays

with source as (

    select *
    from {{ ref('int_burden_disease') }}

),

base as (

    select
        entity,
        code,
        continent,
        year,
        dalys_depressive_disorders,
        dalys_schizophrenia,
        dalys_bipolar_disorder,
        dalys_eating_disorders,
        dalys_anxiety_disorders,

        -- total burden
        dalys_depressive_disorders
        + dalys_schizophrenia
        + dalys_bipolar_disorder
        + dalys_eating_disorders
        + dalys_anxiety_disorders as total_burden

    from source

),

final as (

    select
        entity,
        code,
        continent,
        year,

        round(dalys_depressive_disorders, 4) as dalys_depressive_disorders,
        round(
            100 * (dalys_depressive_disorders - lag(dalys_depressive_disorders) over (
                partition by entity order by year
            )) / lag(dalys_depressive_disorders) over (
                partition by entity order by year
            ),
            4
        ) as depressive_pct_change,

        round(dalys_schizophrenia, 4) as dalys_schizophrenia,
        round(
            100 * (dalys_schizophrenia - lag(dalys_schizophrenia) over (
                partition by entity order by year
            )) / lag(dalys_schizophrenia) over (
                partition by entity order by year
            ),
            4
        ) as schizophrenia_pct_change,

        round(dalys_bipolar_disorder, 4) as dalys_bipolar_disorder,
        round(
            100 * (dalys_bipolar_disorder - lag(dalys_bipolar_disorder) over (
                partition by entity order by year
            )) / lag(dalys_bipolar_disorder) over (
                partition by entity order by year
            ),
            4
        ) as bipolar_pct_change,

        round(dalys_eating_disorders, 4) as dalys_eating_disorders,
        round(
            100 * (dalys_eating_disorders - lag(dalys_eating_disorders) over (
                partition by entity order by year
            )) / lag(dalys_eating_disorders) over (
                partition by entity order by year
            ),
            4
        ) as eating_pct_change,

        round(dalys_anxiety_disorders, 4) as dalys_anxiety_disorders,
        round(
            100 * (dalys_anxiety_disorders - lag(dalys_anxiety_disorders) over (
                partition by entity order by year
            )) / lag(dalys_anxiety_disorders) over (
                partition by entity order by year
            ),
            4
        ) as anxiety_pct_change,

        round(total_burden, 4) as total_burden,
        round(
            100 * (total_burden - lag(total_burden) over (
                partition by entity order by year
            )) / lag(total_burden) over (
                partition by entity order by year
            ),
            4
        ) as total_pct_change

    from base

)

select *
from final
where code is not null
order by entity, year
