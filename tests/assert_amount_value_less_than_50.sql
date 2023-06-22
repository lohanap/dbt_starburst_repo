-- Individual records in payment table should not have amount exceeding 50
-- Therefore return records where this isn't true to make the test fail.
select order_id from {{ ref('stg_payments') }}
where payment_amount > 50