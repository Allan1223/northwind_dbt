with source as (

    select 
       -- primary key
         employee_id	
       
       , title	
       , title_of_courtesy
       , first_name	
       , last_name
       , address
       , postal_code
       , city	
       , region	
       , country	
       , extension
       , home_phone
       , hire_date
       , birth_date		
       , photo_path	
       , notes		
       , reports_to	

      -- , _sdc_received_at	
      -- , _sdc_batched_at
      -- , _sdc_extracted_at	
      -- , _sdc_sequence
      -- , _sdc_table_version	INTEGER	NULLABLE	

     
    from {{ source('northwind_etl', 'employees') }}

)

select * from source