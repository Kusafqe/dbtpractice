with 

source as (

    select O.*, OI.product_id, OI.quantity, P.price_euros from {{ ref("stg_sql_server__orders") }} O 
    LEFT JOIN {{ ref("stg_sql_server__order_items") }} OI
    ON O.order_id = OI.order_id
    LEFT JOIN {{ ref("stg_sql_server__products")}} P
    ON OI.product_id = P.product_id

),

renamed as (

    select
        
        order_id,
        shipping_id,

        product_id,
        quantity,
        price_euros,
        (quantity*price_euros) as price_line_euros,
        
        shipping_cost_euros,
        address_id,
        date_id,
        promo_id,
        estimated_delivery_at,
        order_cost_euros,
        user_id,
        order_total_euros,
        delivered_at,
        tracking_id,
        status_id,
        _fivetran_deleted,
        _fivetran_synced

    from source

)

select * from renamed
