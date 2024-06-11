with 

source as (

    select O.*, OI.product_id, OI.quantity, P.price_euros, PR.discount_euros 
    from {{ ref("stg_sql_server__orders") }} O 
    JOIN {{ ref("stg_sql_server__order_items") }} OI
    ON O.order_id = OI.order_id
    JOIN {{ ref("stg_sql_server__products")}} P
    ON OI.product_id = P.product_id
    JOIN {{ref("stg_sql_server__promos")}} PR
    ON O.promo_id = PR.promo_id
    where O._fivetran_deleted is null

),

renamed as (

    select
        -- id's
        order_id,
        shipping_id,
        product_id,
        address_id,
        promo_id,
        user_id,
        tracking_id,
        status_id,

        quantity as product_quantity,
        --price_euros,
        (quantity*price_euros) as price_line_euros,
        
        -- money
        discount_euros,
        shipping_cost_euros,        
        order_cost_euros,
        
        order_total_euros, -- Utilizar para comparar        
        
        -- dates
        created_at,
        delivered_at,                
        estimated_delivery_at,
        _fivetran_synced_utc

    from source

)



select * from renamed
