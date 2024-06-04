with 

source as (

    select * from {{ source('sql_server', 'products') }}

),

renamed as (

    select
        product_id,
        price as price_euros,
        name,
        inventory,
        _fivetran_deleted,
        CONVERT_TIMEZONE('UTC',_fivetran_synced) as _fivetran_synced

    from source

)

select * from renamed
