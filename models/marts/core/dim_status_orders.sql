
with

    source as (select status_id, status from {{ ref("stg_sql_server__status_orders") }}),

    renamed as (

        select 
            status_id,
            status
        from source

    )

select *
from renamed
