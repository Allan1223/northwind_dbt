with validation as (

    select 
    sum(quantity) as sum_qty
    from {{ ref('fact_order_details') }}
    where order_date between '1997-01-01' and '1997-01-31' 
)

select * from validation where sum_qty != 2401