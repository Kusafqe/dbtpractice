
with

    source as (select * from {{ ref("stg_sql_server__promos") }}
    where _fivetran_deleted is null
    ),
    
    renamed as (

        select 
            promo_id,
            promo_name,
            discount_euros,
            status_id, 
            --_fivetran_deleted,
            _fivetran_synced
        from source
    )

select *
from renamed