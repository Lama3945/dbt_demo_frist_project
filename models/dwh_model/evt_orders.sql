/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

select ID_ORDER,
       ID_USER,
       DT_ORDER,
       LB_STATUS
from {{ ref('stg_jaffle_shop__orders') }}

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
