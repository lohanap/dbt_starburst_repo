with
    payments as (select * from {{ ref("stg_payments") }}),
    orders as (select * from {{ ref("stg_orders") }}),
    payment_agg_amount as(
        select order_id, 
        sum(case when payment_status = 'success' then payment_amount else 0 end) as payment_amount
        from payments p
        group by order_id
    ),
    order_payment as (
        select o.order_id,
        o.order_date, 
        o.customer_id, 
        coalesce(payment_amount,0) as payment_amount
        from payment_agg_amount p
        left join orders o using (order_id)
    )
select *
from     order_payment