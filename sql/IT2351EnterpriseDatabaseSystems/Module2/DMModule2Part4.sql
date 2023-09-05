select invoices.vendor_id, vendors.vendor_name, invoice_number, invoice_date, invoice_total, terms_id
from invoices 
inner join vendors on invoices.vendor_id = vendors.vendor_id