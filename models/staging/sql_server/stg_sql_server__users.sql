with 

source as (

    select * from {{ source('sql_server', 'users') }}

),

renamed as (

    select
        user_id,
        CONVERT_TIMEZONE('UTC',updated_at) as updated_at,
        address_id,
        last_name,
        CONVERT_TIMEZONE('UTC',created_at) as created_at,
        phone_number,
        total_orders,
        first_name,
        email,
        coalesce (regexp_like(email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$')= true,false) as is_valid_email_address, 
        _fivetran_deleted,
        CONVERT_TIMEZONE('UTC',_fivetran_synced) as _fivetran_synced_utc

    from source

)

select * from renamed
