
with selected as (

    select 
    -- primary key
       customer_id
    -- foreing key
       , country	
       , city
       , fax		
       , postal_code	
       , address		
       , region
       , contact_name		
       , phone	
       , company_name	
       , contact_title	   

   from {{ ref('stg_customers') }} --dbt_asilva.stg_customers

), transformed as(

    select
       row_number() over ( order by customer_id) as customer_sk,
       *
       from selected
)

select * from transformed