with source as (
    select
-- primay key
    order_id
-- foreing key    
   , product_id
   , discount
   , unit_price
   , quantity
   
-- _sdc_table_version
-- _sdc_received_at
-- _sdc_sequence
-- _sdc_batched_at
-- _sdc_extracted_at

  from {{ source('northwind_etl', 'order_details') }}
)

select * from source