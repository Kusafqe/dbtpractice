
with

    source as (select distinct status from {{ ref("base_sql_server__promos") }}),

    renamed as (

        select 
            md5(status) as id_status,
            status

        from source
    )

select *
from renamed
