SELECT
code_departement,
nom_departement,
code_region,
nom_region,
year,
'TMF' AS trouble,
tx_hosp_tmf AS tx_hosp,
duree_moy_hosp_tmf AS duree_moy_hosp,
tx_rehosp_30j_tmf AS tx_rehosp_30j
FROM {{ ref('int_france_hospitalisation') }}

UNION ALL

SELECT
code_departement,
nom_departement,
code_region,
nom_region,
year,
'TMS' AS trouble,
tx_hosp_tms AS tx_hosp,
duree_moy_hosp_tms AS duree_moy_hosp,
tx_rehosp_30j_tms AS tx_rehosp_30j
FROM {{ ref('int_france_hospitalisation') }}