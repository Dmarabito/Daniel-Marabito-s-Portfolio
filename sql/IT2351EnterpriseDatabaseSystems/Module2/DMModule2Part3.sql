-- Daniel Marabito
-- So this is mainly proof of save but, what it does is gets a some columns from the invoices table.
-- Specifically the vendor_id, invoice_number, invoice_date, invoice_total, terms_id  columns 
select vendor_id, invoice_number, invoice_date, invoice_total, terms_id from invoices