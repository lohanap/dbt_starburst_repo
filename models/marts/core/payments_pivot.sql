
select
    order_id, 
    case when payment_method = 'credit_card' and payment_status = 'success' then payment_amount else 0 end as credit_card_success,
    case when payment_method = 'credit_card' then payment_amount else 0 end as credit_card_total,
    case when payment_method = 'coupon' and payment_status = 'success' then payment_amount else 0 end as coupon_success,
    case when payment_method = 'coupon' then payment_amount else 0 end coupon_total,
    case when payment_method = 'bank_transfer' and payment_status = 'success' then payment_amount else 0 end as bank_transfer_success,
    case when payment_method = 'bank_transfer' then payment_amount else 0 end as bank_transfer_total,
    case when payment_method = 'gift_card' and payment_status = 'success' then payment_amount else 0 end as gift_card_success,
    case when payment_method = 'gift_card' then payment_amount else 0 end as gift_card_total
from {{ ref('stg_payments') }}