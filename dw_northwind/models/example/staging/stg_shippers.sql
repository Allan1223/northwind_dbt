with source as (

    select 
       -- primary key
         shipper_id
       , phone
       , company_name                
      -- , _sdc_extracted_at	
      -- , _sdc_sequence	
      -- , _sdc_received_at	
      -- , _sdc_batched_at	
      -- , _sdc_table_version
      
    from {{ source('northwind_etl', 'shippers') }}

)

select * from source