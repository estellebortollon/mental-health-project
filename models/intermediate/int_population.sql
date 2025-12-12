{{ config(
    materialized='view'
) }}

select country,
year,
nullif(population, ':') as population
from `mental-health-project-480610.dbt_lboyer.population`
