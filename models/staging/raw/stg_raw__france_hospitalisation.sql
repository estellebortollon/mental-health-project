with 

source as (

    select * from {{ source('raw', 'france_hospitalisation') }}

),

renamed as (

    select
        departement,
        densite_lit_2015,
        densite_lit_2019,
        densite_centre_2015,
        densite_centre_2019,
        densite_psychiatre_2019,
        tx_hosp_tmf_2015,
        tx_hosp_tmf_2019,
        tx_recours_etablissement_ts_2015,
        tx_recours_etablissement_ts_2019,
        duree_moy_hosp_tmf_2015,
        duree_moy_hosp_tmf_2019,
        tx_rehosp_30j_tmf_2015,
        tx_rehosp_30j_tmf_2019,
        tx_hosp_tms_2015,
        tx_hosp_tms_2019,
        duree_moy_hosp_tms_2015,
        duree_moy_hosp_tms_2019,
        tx_rehosp_30j_tms_2015,
        tx_rehosp_30j_tms_2019

    from source

)

select * from renamed