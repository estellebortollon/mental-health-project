with 

source as (

    select * from {{ source('raw', 'nb_of_countries_with_data_on_prevalence_of_mental_disorders') }}

),

renamed as (

    select
        entity,
        code,
        year,
        number_of_countries_with_primary_data_on_prevalence_of_mental_disorders

    from source

)

select * from renamed