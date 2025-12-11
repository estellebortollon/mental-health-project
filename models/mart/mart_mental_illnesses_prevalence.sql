SELECT 
  continent, entity, code, year,  
  'Schizophrenia' AS illness, 
  schizophrenia_disorders AS disorder_pct
FROM {{ ref('int_mental_illnesses_prevalence') }} 
UNION ALL
SELECT 
  continent, entity, code, year,  
  'Depression' AS illness, 
  depressive_disorders AS disorder_pct
FROM {{ ref('int_mental_illnesses_prevalence') }}
UNION ALL
SELECT 
  continent, entity, code, year,  
  'Eating disorders' AS illness, 
  eating_disorders AS disorder_pct
FROM {{ ref('int_mental_illnesses_prevalence') }}
UNION ALL
SELECT 
  continent, entity, code, year,  
  'Anxiety' AS illness, 
  anxiety_disorders AS disorder_pct
FROM {{ ref('int_mental_illnesses_prevalence') }} 
UNION ALL
SELECT 
  continent, entity, code, year,  
  'Bipolar disorder' AS illness, 
  bipolar_disorders AS disorder_pct
FROM {{ ref('int_mental_illnesses_prevalence') }}