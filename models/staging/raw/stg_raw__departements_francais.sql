with 

source as (

    select * from {{ source('raw', 'departements_francais') }}

),

renamed as (

    select
        code_departement,
        nom_departement,
        code_region,
        nom_region

    from source

)

select * from renamed