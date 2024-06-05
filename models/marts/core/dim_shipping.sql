
with

    source as (select distinct shipping_id, shipping_service from {{ ref("stg_sql_server__shipping") }}),

    renamed as (

        select 
            shipping_id,
            shipping_service ,
        from source
    )

select *
from renamed
