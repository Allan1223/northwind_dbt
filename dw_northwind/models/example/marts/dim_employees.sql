with selected as (

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
    
   from {{ ref('stg_employees') }} --dbt_asilva.stg_employees

), transformed as(

    select
       row_number() over ( order by employee_id) as employee_sk,
       *
       from selected
)

select * from transformed

