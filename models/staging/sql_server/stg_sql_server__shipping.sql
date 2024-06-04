
with

    source as (select distinct shipping_id, shipping_service from {{ ref("base_sql_server__orders") }}),

    renamed as (

        select 
            shipping_id,
            shipping_service ,
        from source
    )

select *
from renamed
