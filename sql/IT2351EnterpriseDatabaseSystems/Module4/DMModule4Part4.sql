-- Daniel Marabito
select state, count(customer_id) -- count customers
from addresses
group by state; -- group the count by state.
