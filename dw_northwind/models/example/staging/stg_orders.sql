with source as (
  select
    -- primary key
    order_id
    --foreing key
  ,  employee_id
  ,  customer_id
  ,  order_date
  ,  required_date
  ,  freight
  ,  ship_name 
  ,  ship_region
  ,  shipped_date
  ,  ship_country       
  ,  ship_postal_code
  ,  ship_city
  ,  ship_via as shipper_id
  ,  ship_address
   -- _sdc_batched_at
   -- _sdc_extracted_at
   -- _sdc_table_version
   -- _sdc_received_at
   -- _sdc_sequence
   from {{ source('northwind_etl', 'orders') }}

)

select * from source