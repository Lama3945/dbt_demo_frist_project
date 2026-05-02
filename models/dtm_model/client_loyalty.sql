
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}


with last_order as (
    SELECT id_order,
           id_user
    FROM {{ ref('evt_orders')}} ord
    QUALIFY ROW_NUMBER() OVER(PARTITION BY ord.id_order 
            ORDER BY ord.dt_order DESC
           )=1
)

select client.id_client,
       client.lb_first_name,
       client.lb_last_name,
       max(payment.dt_payment)          AS DT_LAST_PAYMENT,
       min(payment.dt_payment)          AS DT_FIRST_PAYMENT,
       count(distinct payment.id_order) AS NUMBER_OF_ORDER,
       sum(payment.mt_payment)          AS MT_TOTAL_PAYMENT,
       0                                AS MT_LOYALTY
from {{ ref('dim_client')}} client
left join last_order 
ON client.id_client = last_order.id_user
left join {{ ref('fait_payment') }} payment
ON last_order.id_order = payment.id_order
group by all

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
