with selected as (

   select 
       -- primary key
         shipper_id
       , phone
       , company_name 
    
   from {{ ref('stg_shippers') }} --dbt_asilva.stg_shippers

), transformed as(

    select
       row_number() over ( order by shipper_id) as shipper_sk,
       *
       from selected
)

select * from transformed