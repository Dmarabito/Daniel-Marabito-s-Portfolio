-- Daniel Marabito
create User 'GiantDad' identified by 'Password';
alter user 'GiantDad' password expire password history 5;
grant update on darksouls.inventory to 'GiantDad';
grant 'player' to 'GiantDad';
