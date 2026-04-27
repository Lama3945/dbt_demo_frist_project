/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

select src.id                           AS ID_PAYMENT,
       src.orderid                      AS ID_ORDER,
       ifnull(dim.id_payment_method,-1) AS ID_PAYMENT_METHOD,
       src.amount                       AS MT_PAYMENT,
       src.created                      AS DT_PAYMENT,
       src.status                       AS LB_STATUS,
from {{ source('stripe', 'payments') }} src
left {{ ref('dim_payment_method') }}  dim
ON ifnull(src.paymentmethod,'a') = ifnull(dim.lb_payment_method,'b')

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
