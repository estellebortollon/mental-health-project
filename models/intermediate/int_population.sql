{{ config(
    materialized='view'
) }}

select 
    country,
    year,
    cast(
        nullif(replace(population, ' ', ''), ':') 
        as int64
    ) as population
from `mental-health-project-480610.dbt_lboyer.population`