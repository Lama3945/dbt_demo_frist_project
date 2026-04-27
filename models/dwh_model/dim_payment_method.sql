
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

select LB_PAYMENT_METHOD,
       HASH_PAYMENT_METHOD
from {{ ref('stg_stripe__payment') }}
QUALIFY ROW_NUMBER() OVER(PARTITION BY HASH_PAYMENT_METHOD
ORDER BY LB_PAYMENT_METHOD DESC)=1

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
