with 

source as (

    select * from {{ ref('stg_sql_server__addresses') }}
    where _fivetran_deleted is null
),

renamed as (

    select
        address_id,
        zipcode,
        country,
        address,
        state,
        --_fivetran_deleted,
        _fivetran_synced_utc

    from source

)

select * from renamed
