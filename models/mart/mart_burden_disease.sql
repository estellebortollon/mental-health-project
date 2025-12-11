SELECT 
  continent, entity, code, year,  
  'Depression' AS illness, 
  dalys_depressive_disorders AS nb_years
FROM {{ ref('int_burden_disease') }}
UNION ALL
SELECT 
  continent, entity, code, year,  
  'Schizophrenia' AS illness, 
  dalys_schizophrenia AS nb_years
FROM {{ ref('int_burden_disease') }}
UNION ALL
SELECT 
  continent, entity, code, year,  
  'Bipolar disorders' AS illness, 
  dalys_bipolar_disorder AS nb_years
FROM {{ ref('int_burden_disease') }}
UNION ALL
SELECT 
  continent, entity, code, year,  
  'Anxiety' AS illness, 
  dalys_anxiety_disorders AS nb_years
FROM {{ ref('int_burden_disease') }}
UNION ALL
SELECT 
  continent, entity, code, year,  
  'Eating disorders' AS illness, 
  dalys_eating_disorders AS nb_years
FROM {{ ref('int_burden_disease') }}