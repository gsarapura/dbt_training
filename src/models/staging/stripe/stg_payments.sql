-- My solution:
-- with payments as (
--
--     select
--         order_id,
--         amount as payment_amount
--
--     from raw.stripe.payment
--
-- )
--
-- select * from payments where status='success'

select
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    amount as payment_amount,
    status,

    -- amount is stored in cents, convert it to dollars
    {{ cents_to_dollars('payment_amount', 4) }} as amount,
    created as created_at

from  {{ source('stripe', 'payment') }}
