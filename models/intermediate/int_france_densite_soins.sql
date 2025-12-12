SELECT 
departement,
year,
densite_lit,
densite_centre,
FROM {{ ref('int_france_hospitalisation') }}