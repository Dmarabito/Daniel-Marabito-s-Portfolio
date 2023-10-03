-- Daniel Marabito
select 
vendor_name as "name"
, trim(upper(vendor_name)) as "NAME", -- upper for capital, trim to remove spaces
vendor_phone as "phone",
right(vendor_phone,4) as "Last 4 of phone", -- last 4 digits, is 4 digits from the right.
if (/*conditon*/ locate(" ", Vendor_name) = 0, -- checks if it is one word. 
/*if true*/ vendor_name, -- if it is one word puts the vendor name.
/*if false*/ substring_index(trim(mid(Vendor_name,locate(" ",Vendor_name)))," ",1) -- if it is more then one word, get the 1st space and everything after. trim space off...
) as "Second word of vendor name" -- continuing comment on line above. Then get everything left of 1st space, aka second word.
from vendors
;