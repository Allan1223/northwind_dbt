with sources as (

    select 
         supplier_id		  
       , address			
       , postal_code				
       , city		
       , region		
       , country			
       , fax		
       , homepage		     
       , contact_name			
       , phone			
       , company_name			
       , contact_title			
      -- , _sdc_batched_at			
      -- , _sdc_extracted_at		
      -- , _sdc_table_version			
      -- , _sdc_sequence		
      -- , _sdc_received_at		
      from {{ source('northwind_etl', 'suppliers') }}
     

)

select * from sources