
/*
    Welcome !
    This model created view over our source data:
        That make 
               - column rename with respect target usage name
               - data type 
               - and other transformantion
*/

select id         AS ID_CLIENT,
       first_name AS LB_FIRST_NAME,
       last_name  AS LB_LAST_NAME
from {{ source('jaffle_shop', 'customers') }}

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
