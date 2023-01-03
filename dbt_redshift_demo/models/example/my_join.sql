
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with source_data as (

select f.productkey , f.orderdatekey , f.customerkey , f.salesamount , c.firstname , c.lastname
from FactInternetSales f join dimcustomer c on f.customerkey=c.customerkey
)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
