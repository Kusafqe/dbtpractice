with 

source as (

    select * from {{ ref("base_sql_server__orders") }}

),

renamed as (

    select
        order_id,
        md5(IFF(shipping_service='', 'desconocido' , shipping_service)) as shipping_id,
        address_id,
        created_at,
        promo_id,
        estimated_delivery_at,
        order_cost,
        user_id,
        order_total,
        delivered_at,
        tracking_id,
        status,
        _fivetran_deleted,
        _fivetran_synced

    from source

)

select * from renamed
