/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

select DISTINCT ID         AS ID_ORDER,
                ORDER_DATE AS DT_ORDER,
                STATUS     AS LB_STATUS
from {{ source('jaffle_shop', 'orders') }}

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
