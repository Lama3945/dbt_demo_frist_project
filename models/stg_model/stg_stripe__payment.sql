/*
    Welcome !
    This model created view over our source data:
        That make 
               - column rename with respect target usage name
               - data type 
               - and other transformantion
*/

select src.id                             AS ID_PAYMENT,
       src.orderid                        AS ID_ORDER,
       src.amount                         AS MT_PAYMENT,
       src.created                        AS DT_PAYMENT,
       src.status                         AS LB_STATUS,
       paymentmethod                      AS LB_PAYMENT_METHOD,
       hash(upper(trim(paymentmethod)))   AS HASH_PAYMENT_METHOD
from {{ source('stripe', 'payment') }} src

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
