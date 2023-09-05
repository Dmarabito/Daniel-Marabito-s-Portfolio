-- Daniel Marabito
select concat(customer_first_name," ",customer_last_name) as "Contact Name", -- combines first name and last name with space in middle. Makes it appear as contact name.
customer_state as "State" -- mases customer_state appear as State
from customers -- the table it is from is customers
where customer_state = "OH" or customer_state = "CA" -- Limiting the select to those from ohio and california.
Order by customer_state, customer_last_name, customer_first_name; -- Order the data based on state, then last name, then first name.
