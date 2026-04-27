/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

select src.ID_PAYMENT,
       src.ID_ORDER,
       dim.hash_payment_method,
       src.MT_PAYMENT,
       src.DT_PAYMENT,
       src.LB_STATUS,
from {{ ref('stg_stripe__payment') }} src
left join {{ ref('dim_payment_method') }}  dim
ON src.hash_payment_method = dim.hash_payment_method

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
