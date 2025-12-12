with table1 as (
    select *
    from {{ ref('int_health_europe') }}
),
table2 as (
    select *
    from {{ ref('int_population') }}
)

select
    coalesce(t1.country, t2.country) as country,
    coalesce(t1.year, t2.year) as year,
    t1.Nb_beds_psy,
    t1.Nb_psychiatrist,
    t1.health_expenditure,
    t1.`chronic_disease_share_%`,
    t1.death_suicide_per_100000,
    t1.death_alcohol_per_100000,
    t1.nb_years_healthy_life,
    t1.alcohol_consumption,
    t1.antidepressants_consumption,
    t1.anxiolytics_consumption,
    t1.hypnotics_consumption,
    t1.`Performing health-enhancing physical activity _%`,
    t1.`Overall perceived social support - Strong _%`,
    t1.`Overall perceived social support -Intermediate_%`,
    t1.`Overall perceived social support -Poor_%`,
    t1.`Life evaluation_3-year AVG`,
    t2.population
from table1 t1
left join table2 t2
    on t1.country = t2.country
    and t1.year = t2.year