-- Daniel Marabito
-- used a case to check if phone was null, and used on to see if invoice_total is high
select invoice_id, vendor_name,
case when vendor_phone is null then "No phone provided"
else vendor_phone end as "Phone",
case when invoice_total > 1500 then "high"
else "Low"
end as  "Value Category"

from invoices as i join vendors as v on i.vendor_id = v.vendor_id;
