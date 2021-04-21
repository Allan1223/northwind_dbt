with source as (

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
     --   _sdc_sequence	INTEGER	NULLABLE
     --   _sdc_received_at	TIMESTAMP	NULLABLE
     --   _sdc_table_version	INTEGER	NULLABLE	
     --   _sdc_batched_at	TIMESTAMP	NULLABLE	
     --   _sdc_extracted_at	TIMESTAMP	NULLABLE	

   from {{ source('northwind_etl', 'customers') }}
  

)

select * from source