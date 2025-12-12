SELECT 
departement,
nom_departement,
code_region,
nom_region,
year,
densite_lit,
densite_centre,
FROM {{ ref('int_france_hospitalisation') }}