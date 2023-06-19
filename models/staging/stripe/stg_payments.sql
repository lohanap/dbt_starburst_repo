select
    orderid as order_id,
    amount/100 as payment_amount,
    status as payment_status
from {{ source('stripe', 'payment') }}