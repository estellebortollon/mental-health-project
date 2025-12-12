{{ config(
    materialized='view'
) }}

with table1 as (
    select *
    from {{ ref('mart_health_europe') }}
    where year in (2015, 2019)
),

table2 as (
    select *
    from {{ ref('burden_country_evol') }}
    where year in (2015, 2019)
),

table3 as (
    select *
    from {{ ref('prevalence_country_evol') }}
    where year in (2015, 2019)
)

select
    -- colonnes clés uniques
    coalesce(t1.country, t2.entity, t3.entity) as country,
    coalesce(t1.year, t2.year, t3.year) as year,

    -- colonnes table1
    t1.Nb_beds_psy,
    t1.Nb_psychiatrist,
    t1.health_expenditure,
    t1.chronic_disease_share,
    t1.death_suicide_per_100000,
    t1.death_alcohol_per_100000,
    t1.nb_years_healthy_life,
    t1.alcohol_consumption,
    t1.antidepressants_consumption,
    t1.anxiolytics_consumption,
    t1.hypnotics_consumption,
    t1.sports_share,
    t1.social_support_strong_share,
    t1.social_support_intermediate_share,
    t1.social_support_poor_share,
    t1.life_evaluation_3Y,
    t1.population,
    t1.beds_per_100000,
    t1.psychiatrist_per_100000,
    t1.health_exp_per_100000,
    t1.total_treatment_consumption,

    -- colonnes table2 (sans entity, year)
    t2.total_burden,
    t2.total_pct_change as burden_evol,

    -- colonnes table3 (sans entity, year)
    t3.total_disorders as total_prevalence,
    t3.total_pp_change as prevalence_evol

from table1 t1
left join table2 t2
    on t1.country = t2.entity
    and t1.year = t2.year

left join table3 t3
    on t1.country = t3.entity
    and t1.year = t3.year