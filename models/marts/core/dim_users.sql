with 

source as (

    select * from {{ ref('stg_sql_server__users') }}
    where _fivetran_deleted is null

),

renamed as (

    select
        user_id,
        updated_at,
        address_id,
        last_name,
        created_at,
        phone_number,
        total_orders,
        first_name,
        email,
        --coalesce (regexp_like(email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$')= true,false) as is_valid_email_address, 
        --_fivetran_deleted,
        _fivetran_synced

    from source

)

select * from renamed
