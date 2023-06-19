with
    payments as (select * from {{ ref("stg_payments") }}),
    orders as (select * from {{ ref("stg_orders") }}),
    customer_payments as (
        select o.order_id, o.customer_id, p.payment_amount
        from payments p
        join orders o using (order_id)
    )
select *
from customer_payments