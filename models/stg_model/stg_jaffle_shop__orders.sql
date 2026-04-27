/*
    Welcome !
    This model created view over our source data:
        That make 
               - column rename with respect target usage name
               - data type 
               - and other transformantion
*/

select DISTINCT ID         AS ID_ORDER,
                USER_ID    AS ID_USER,
                ORDER_DATE AS DT_ORDER,
                STATUS     AS LB_STATUS
from {{ source('jaffle_shop', 'orders') }}

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
