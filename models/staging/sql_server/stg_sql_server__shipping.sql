
with

    source as (select shipping_service, shipping_cost from {{ ref("base_sql_server__orders") }}),

    renamed as (

        select 
            md5(shipping_service) as shipping_id,
            IFF(shipping_service='', 'desconocido' , shipping_service) as shipping_service ,
            shipping_cost
        from source
    )

select *
from renamed
