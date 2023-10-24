-- Daniel Marabito

create table Artists (
artist_id int primary key auto_increment,
First_name varchar(30),
Last_name varchar(30)
);

insert into artists (First_name,Last_name)
values ("toriyufu", null),
('Nakano','Haito'),
('Tonamikanji', null),
('Naochika','Morishita');