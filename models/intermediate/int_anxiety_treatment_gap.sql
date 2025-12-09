-- Création colonne avec les continents 

with source as (

    select *
    from {{ ref('stg_raw__anxiety_treatment_gap') }}

)

select
    *,
    case
        /* Europe */
        when code in ('ALB','AND','AUT','BEL','BGR','BIH','BLR','CHE','CYP',
                      'CZE','DEU','DNK','ESP','EST','FIN','FRA','GBR','GRC',
                      'HRV','HUN','IRL','ISL','ITA','LTU','LUX','LVA','MDA',
                      'MKD','MLT','MNE','NLD','NOR','POL','PRT','ROU','RUS',
                      'SRB','SVK','SVN','SWE','UKR') then 'Europe'
        /* Asia */
        when code in ('AFG','ARM','AZE','BGD','BRN','BTN','CHN','GEO','HKG','IND','IDN',
                      'JPN','KAZ','KGZ','KHM','KOR','LAO','LKA','MDV','MNG','MMR','MYS',
                      'NPL','PAK','PHL','SGP','TJK','THA','TLS','TKM','TWN','UZB','VNM') then 'Asia'
        /* Middle East */
        when code in ('BHR','IRN','IRQ','ISR','JOR','KWT','LBN','OMN','PSE','QAT',
                      'SAU','SYR','ARE','YEM','TUR') then 'Middle East'
        /* Africa */
        when code in ('DZA','AGO','BEN','BWA','BFA','BDI','CMR','CPV','CAF','TCD',
                      'COM','COG','CIV','COD','DJI','EGY','GNQ','ERI','ETH','GAB',
                      'GMB','GHA','GIN','GNB','KEN','LSO','LBR','LBY','MDG','MWI',
                      'MLI','MAR','MRT','MUS','MOZ','NAM','NER','NGA','RWA','STP',
                      'SEN','SYC','SLE','SOM','ZAF','SSD','SDN','SWZ','TGO','TUN',
                      'TZA','UGA','ZMB','ZWE') then 'Africa'
        /* North America */
        when code in ('USA','CAN','MEX','GRL','BMU','GLP','MTQ','PRI','CUW','HTI','DOM') then 'North America'
        /* South America */
        when code in ('ARG','BOL','BRA','CHL','COL','ECU','GUY','PRY','PER','SUR','URY','VEN') then 'South America'
        /* Australasia / Oceania */
        when code in ('AUS','NZL','FJI','PNG','SLB','VUT','WSM','TON','KIR','TUV','NRU') then 'Australasia'
        else 'Other'
    end as continent

from source