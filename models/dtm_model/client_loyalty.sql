
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

select client.id_client,
       client.lb_first_name,
       client.lb_last_name,
       max(payment.dt_payment)          AS DT_LAST_PAYMENT,
       min(payment.dt_payment)          AS DT_FIRST_PAYMENT,
       count(distinct payment.id_order) AS NUMBER_OR_ORDER,
       sum(payment.mt_payment)          AS MT_TOTAL_PAYMENT
from {{ ref('dim_client')}} client
left join {{ ref('fait_payment') }} payment
ON client.id_client = payment.id_client

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
