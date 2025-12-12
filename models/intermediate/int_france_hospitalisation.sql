SELECT
departement,
'2015' AS year,
densite_lit_2015 AS densite_lit,
densite_centre_2015 AS densite_centre,
tx_hosp_tmf_2015 AS tx_hosp_tmf,
tx_hosp_tms_2015 AS tx_hosp_tms,
tx_recours_etablissement_ts_2015 AS tx_recours_ts,
duree_moy_hosp_tmf_2015 AS duree_moy_hosp_tmf,
duree_moy_hosp_tms_2015 AS duree_moy_hosp_tms,
tx_rehosp_30j_tmf_2015 AS tx_rehosp_30j_tmf,
tx_rehosp_30j_tms_2015 AS tx_rehosp_30j_tms,
FROM {{ ref('stg_raw__france_hospitalisation') }}

UNION ALL

SELECT
departement,
'2019' AS year,
densite_lit_2019 AS densite_lit,
densite_centre_2019 AS densite_centre,
tx_hosp_tmf_2019 AS tx_hosp_tmf,
tx_hosp_tms_2019 AS tx_hosp_tms,
tx_recours_etablissement_ts_2019 AS tx_recours_ts,
duree_moy_hosp_tmf_2019 AS duree_moy_hosp_tmf,
duree_moy_hosp_tms_2019 AS duree_moy_hosp_tms,
tx_rehosp_30j_tmf_2019 AS tx_rehosp_30j_tmf,
tx_rehosp_30j_tms_2019 AS tx_rehosp_30j_tms,
FROM {{ ref('stg_raw__france_hospitalisation') }}
