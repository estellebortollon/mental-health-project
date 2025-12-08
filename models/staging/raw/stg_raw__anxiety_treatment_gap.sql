with 

source as (

    select * from {{ source('raw', 'anxiety_treatment_gap') }}

),

renamed as (

    select
        entity,
        code,
        year,
        potentially_adequate_treatment_conditional,
        other_treatments_conditional,
        untreated_conditional

    from source

)

select * from renamed