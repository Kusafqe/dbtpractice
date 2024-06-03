
with

    source as (select distinct status_id, status from {{ ref("base_sql_server__orders") }}),

    renamed as (

        select 
            status_id,
            status
        from source

    )

select *
from renamed
