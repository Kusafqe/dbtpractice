{{ config(materialized="view") }}

with
    src_budget as (select * from {{ ref("stg__budget") }}),

    renamed_casted as (
        select _row, product_id, quantity, month, date_load from src_budget
    )

select *
from renamed_casted
