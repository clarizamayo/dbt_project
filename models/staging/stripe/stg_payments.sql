with payments as (

    select
        orderid as order_id,
        sum(case when status = 'success' then amount end) as amount

    from {{ source('stripe', 'payment') }}
    group by 1

)

select * from payments