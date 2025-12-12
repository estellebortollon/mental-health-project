SELECT
t.*,
ds.densite_lit,
ds.densite_centre,
FROM {{ ref('int_france_hosp_troubles') }} AS t
FULL OUTER JOIN {{ ref('int_france_densite_soins') }} AS ds
ON ds.departement = t.code_departement