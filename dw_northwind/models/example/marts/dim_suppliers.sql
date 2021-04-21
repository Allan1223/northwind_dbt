with suppliers as (
    select *
    from {{ ref('stg_suppliers')}}
        
   
),

divisions as (
  select *
    from {{ ref('seed_suppliers_divisions') }}

)


, transformed as(

    select
       row_number() over ( order by supplier_id) as supplier_sk
       , suppliers.supplier_id		  
       , suppliers.address			
       , suppliers.postal_code				
       , suppliers.city		
       , suppliers.region		
       , suppliers.country
       , divisions.division 			
       , suppliers.fax		
       , suppliers.homepage		     
       , suppliers.contact_name			
       , suppliers.phone			
       , suppliers.company_name			
       , suppliers.contact_title		
      
       from suppliers
       left join divisions on suppliers.country = divisions.country
)

select * from transformed

