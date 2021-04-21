with qty_not_negative as (
-- Refunds have a negative qty, so the qty should always be >= 0.
-- Therefore return records where this isn't true to make the test fail


select
    sum(quantity) as qty
    from {{ ref('fact_order_details' )}}
    

)

select * from qty_not_negative 
    group by 1
    having not(qty >= 0)