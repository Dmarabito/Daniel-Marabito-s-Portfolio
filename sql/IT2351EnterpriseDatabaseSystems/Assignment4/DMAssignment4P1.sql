-- Daniel Marabito
-- Used a union to combine the two tables.
select invoice_id, vendor_id, invoice_number, invoice_date, invoice_total,
payment_total, credit_total, invoice_due_date, payment_date
from active_invoices
union
select invoice_id, vendor_id, invoice_number, invoice_date, invoice_total,
payment_total, credit_total, invoice_due_date, payment_date
from paid_invoices
order by invoice_id
;