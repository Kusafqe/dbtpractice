
with

    source as (select * from {{ ref("base_sql_server__promos") }}),

    renamed as (

        select 
            promo_id,
            promo_name,
            discount_euros,
            md5(status) as status_id, 
            _fivetran_deleted,
            _fivetran_synced
        from source
    )

select *
from renamed
