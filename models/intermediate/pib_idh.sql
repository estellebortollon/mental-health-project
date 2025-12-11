{{ config(
    materialized='view'
) }}

select *
from `mental-health-project-480610.dbt_rchampion.pib_idh`
