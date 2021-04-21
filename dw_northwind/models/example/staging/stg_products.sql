with source as (

    select 
       -- primary key
        product_id	
       -- Foreign key
       , category_id	
       , supplier_id

       , product_name  
       , units_in_stock		
       , unit_price	      	
       , quantity_per_unit		
       , reorder_level		
       , units_on_order		
       , case
            when discontinued = 1 then 'True'
            else 'False'
        end as is_discontinued
      -- Stich Columns
       , _sdc_extracted_at	as last_etl_run
      -- , _sdc_batched_at	      
      -- , _sdc_table_version
      -- , _sdc_received_at	
      -- , _sdc_sequence			
      
    from {{ source('northwind_etl', 'products') }}

)

select * from source