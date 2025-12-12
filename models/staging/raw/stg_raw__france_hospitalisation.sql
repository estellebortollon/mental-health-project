with 

source as (

    select * from {{ source('raw', 'france_hospitalisation') }}

),

renamed as (

    select

    from source

)

select * from renamed