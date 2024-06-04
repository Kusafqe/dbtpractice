with 

source as (

    select O.*, OI.product_id, OI.quantity from {{ ref("stg_sql_server__orders") }} O 
    LEFT JOIN {{ ref("stg_sql_server__order_items") }} OI
    ON O.order_id = OI.order_id

),

renamed as (

    select
        *
        -- order_id,
        -- shipping_id,
        -- shipping_cost_euros
        -- address_id,
        -- created_at,
        -- promo_id,
        -- estimated_delivery_at,
        -- order_cost_euros,
        -- user_id,
        -- order_total_euros,
        -- delivered_at,
        -- tracking_id,
        -- status_id,
        -- _fivetran_deleted,
        -- _fivetran_synced

    from source

)

select * from renamed
