
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

select id         AS ID_CLIENT,
       first_name AS LB_FIRST_NAME,
       last_name  AS LB_LAST_NAME
from {{ source('jaffle_shop', 'customers') }}

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
