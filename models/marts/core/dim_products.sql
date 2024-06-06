with 

source as (

    select * from {{ ref('stg_sql_server__products') }}
    where _fivetran_deleted is null
),

renamed as (

    select
        product_id,
        price_euros,
        name,
        inventory,
        --_fivetran_deleted,
        _fivetran_synced_utc

    from source

)

select * from renamed
