-- Daniel Marabito
-- So first I grabbed the vendor id.
-- then I combined the first name and last name with a space in the middle.
-- That full nambe combo got the alias "Full Name"
-- then Order by vendor id.
select Vendor_id, concat(first_name,' ',last_name) as 'Full Name' from Vendor_contacts order by Vendor_id