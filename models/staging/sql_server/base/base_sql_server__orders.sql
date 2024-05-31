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
        CONVERT_TIMEZONE('UTC',created_at) as created_at,
        IFF(promo_id = '', md5('desconocido'), md5(promo_id)) as promo_id, 
        estimated_delivery_at,
        order_cost as order_cost_euros,
        user_id,
        order_total as order_total_euros,
        CONVERT_TIMEZONE('UTC',delivered_at) as delivered_at,
        tracking_id,
        status,
        _fivetran_deleted, -- where is null
        CONVERT_TIMEZONE('UTC', _fivetran_synced) AS _fivetran_synced

    from source
    

)

select * from renamed
