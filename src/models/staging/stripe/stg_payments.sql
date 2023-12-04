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
    status,

    -- amount is stored in cents, convert it to dollars
    amount / 100 as amount,
    created as created_at

from  {{ source('stripe', 'payment') }}
