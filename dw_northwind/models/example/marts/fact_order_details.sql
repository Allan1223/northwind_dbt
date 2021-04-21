with customers as (

    select *
    from  {{ ref('dim_customers') }}
),
employees as (

    select *
    from {{ ref('dim_employees') }}
),
products as (

    select *
    from {{ ref('dim_products') }} 
),
shippers as (

    select *
    from {{ ref('dim_shippers') }} --dbt_asilva.dim_shippers
),
suppliers as (

    select * 
    from {{ ref('dim_suppliers') }}
),

orders_with_sk as (
   
   select
    -- primary key
    orders.order_id
    --foreing key
  ,  employees.employee_sk  as employee_fk
  ,  customers.customer_sk  as customer_fk
  ,  shippers.shipper_sk    as shipper_fk
  --,  suppliers.supplier_sk  as supplier_fk
  ,  orders.order_date
  ,  orders.required_date
  ,  orders.freight
  ,  orders.ship_name 
  ,  orders.ship_region
  ,  orders.shipped_date
  ,  orders.ship_country       
  ,  orders.ship_postal_code
  ,  orders.ship_city  
  ,  orders.ship_address
     from {{ ref('stg_orders') }}  as orders
   left join employees on orders.employee_id = employees.employee_id
   left join customers on orders.customer_id = customers.customer_id
   left join shippers  on orders.shipper_id  = shippers.shipper_id
   
),
order_detail_with_sk as (

    select
    order_details.order_id
-- foreing key    
   , products.product_sk   as product_fk   
   , suppliers.supplier_sk as supplier_fk
   , order_details.product_id
   , order_details.discount
   , order_details.unit_price
   , order_details.quantity
   
   from {{ ref('stg_order_details') }} as order_details
   left join products  on order_details.product_id = products.product_id
   left join suppliers on products.supplier_id     = suppliers.supplier_id
   
),
 final as (

     select 
     orders_with_sk.order_id
  ,  orders_with_sk.employee_fk
  ,  orders_with_sk.customer_fk
  ,  orders_with_sk.shipper_fk  
  ,  order_detail_with_sk.supplier_fk
  ,  orders_with_sk.order_date
  ,  orders_with_sk.required_date
  ,  orders_with_sk.freight
  ,  orders_with_sk.ship_name 
  ,  orders_with_sk.ship_region
  ,  orders_with_sk.shipped_date
  ,  orders_with_sk.ship_country       
  ,  orders_with_sk.ship_postal_code
  ,  orders_with_sk.ship_city  
  ,  orders_with_sk.ship_address
  ,  order_detail_with_sk.product_fk
  ,  order_detail_with_sk.discount 
  ,  order_detail_with_sk.unit_price
  ,  order_detail_with_sk.quantity
  from orders_with_sk
  left join order_detail_with_sk on orders_with_sk.order_id = order_detail_with_sk.order_id 

 )

select * from final

