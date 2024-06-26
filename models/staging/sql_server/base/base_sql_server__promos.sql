
with

    source as (select * from {{ source("sql_server", "promos") }}),

    renamed as (

        select 
            md5(promo_id) as promo_id,
            promo_id as promo_name,
            discount as discount_euros,
            md5(status) as status_id,
            IFF(status = 'inactive', 0, 1) as status, 
            _fivetran_deleted,
            CONVERT_TIMEZONE('UTC', _fivetran_synced) AS _fivetran_synced
        from source
        union all
        select
            md5('desconocido') as promo_id,
            ('desconocido') as promo_name,
            0,
            md5(0) as status_id,
            (0) as status,
            null,
            null
    )

select *
from renamed
