with 

source as (

    select * from {{ source('sql_server', 'order_items') }}

),

renamed as (

    select
        order_id,
        product_id,
        quantity,
        _fivetran_deleted,
        CONVERT_TIMEZONE('UTC',_fivetran_synced) as _fivetran_synced_utc

    from source

)

select * from renamed
