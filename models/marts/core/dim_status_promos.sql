
with

    source as (select distinct status_id, status from {{ ref("stg_sql_server_status_promos") }}),

    renamed as (

        select 
            status_id,
            status

        from source
    )

select *
from renamed
