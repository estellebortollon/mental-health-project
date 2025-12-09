WITH average AS (

SELECT
  entity,
  code,
  AVG(schizophrenia_disorders) AS schizophrenia,
  AVG(depressive_disorders) AS depression,
  AVG(anxiety_disorders) AS anxiety,
  AVG(bipolar_disorders) AS bipolarity,
  AVG(eating_disorders) AS eating_disorders,
FROM {{ ref('stg_filtered_raw__mental_illnesses_prevalence') }}
GROUP BY entity, code

)

SELECT 
  entity, 
  code,
  schizophrenia + depression + anxiety + bipolarity + eating_disorders AS all_illnesses
FROM average
ORDER BY all_illnesses DESC