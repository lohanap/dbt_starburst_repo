select
    order_id, 
    {% for payment_method in  %}
    case when payment_method = '{{payment_method}}' and payment_status = 'success' then payment_amount else 0 end as {{payment_method}}_success,
    case when payment_method = '{{payment_method}}' then payment_amount else 0 end as {{payment_method}}_total{% if not loop.last %}, {% endif %}
    {%- endfor %}
from {{ ref('stg_payments') }}