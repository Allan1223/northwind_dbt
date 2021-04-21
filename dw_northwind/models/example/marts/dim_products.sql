with selected as (

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
       , is_discontinued -- campos transformado
      -- Stich Columns
       , last_etl_run
     
    
   from {{ ref('stg_products') }} --dbt_asilva.stg_products

), transformed as(

    select
       row_number() over ( order by product_id) as product_sk,
       *
       from selected
)

select * from transformed

