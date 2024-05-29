with 

source as (

    select * from {{ source('sql_server', 'orders') }}

),

renamed as (

    select
        order_id,
        shipping_service,
        shipping_cost,
        address_id,
        created_at,
        promo_id as promo_name,
        IFF(promo_id = '', md5('desconocido'), md5(promo_id)) as promo_id, 
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
