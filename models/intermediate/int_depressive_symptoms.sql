SELECT
  entity AS symptom,
  nearly_every_day,
  more_than_half_the_days,
  several_days
FROM {{ ref('stg_raw__depressive_symptoms') }}