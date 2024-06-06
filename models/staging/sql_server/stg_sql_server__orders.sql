with 

source as (

    select * from {{ ref("base_sql_server__orders") }}

),

renamed as (

    select
        order_id,
        shipping_id,
        shipping_cost_euros,
        address_id,
        (year(created_at)*10000+month(created_at)*100+day(created_at)) as date_id,
        promo_id,
        estimated_delivery_at,
        order_cost_euros,
        user_id,
        order_total_euros,
        delivered_at,
        tracking_id,
        status_id,
        _fivetran_deleted,
        CONVERT_TIMEZONE('UTC',_fivetran_synced) as _fivetran_synced_utc

    from source

)

select * from renamed
