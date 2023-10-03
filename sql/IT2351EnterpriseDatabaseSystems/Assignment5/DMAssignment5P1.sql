-- Daniel Marabito
-- Length gives the number based on length of string, position locates character, postive substring is before, negative is after.
select email_address as "Email address",
length(email_address) as "Length",
position("@" in email_address) as "@",
substring_index(email_address, "@",1) as "Username",
substring_index(email_address, "@",-1) as "Domain"
from customers
;
