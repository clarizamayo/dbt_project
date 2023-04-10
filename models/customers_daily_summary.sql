with customer_daily_summary as (
select 
    {{ dbt_utils.generate_surrogate_key(['customer_id', 'order_id']) }} as id,
    customer_id,
    order_date,
    count(*)
from {{ ref('stg_orders') }}
group by 1,2,3
)

select * from customer_daily_summary