select *,
round(Nb_beds_psy/population*100000,2) as beds_per_100000,
round(Nb_psychiatrist/population*100000,2) as psychiatrist_per_100000,
round(health_expenditure/population*100000,2) as health_exp_per_100000,
round(antidepressants_consumption+anxiolytics_consumption+hypnotics_consumption,2) as total_treatment_consumption
from {{ ref('int_merge_pop_health_europe') }}