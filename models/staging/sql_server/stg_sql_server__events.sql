with 

source as (

    select * from {{ source('sql_server', 'events') }}

),

renamed as (

    select
        event_id,
        page_url,
        event_type,
        user_id,
        IFF(product_id='', null, product_id) as product_id,
        session_id,
        created_at,
        IFF(order_id='', null, order_id) as order_id,
        _fivetran_deleted,
        CONVERT_TIMEZONE('UTC',_fivetran_synced) as _fivetran_synced_utc

    from source

)

select * from renamed
