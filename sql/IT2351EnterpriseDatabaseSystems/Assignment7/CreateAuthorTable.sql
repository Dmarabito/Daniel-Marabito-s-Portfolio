-- Daniel Marabito
create table Authors (
author_id int primary key auto_increment,
name varchar(30) not null,
mailing_address varchar(100),
email varchar(30)
);
insert into Authors (name, mailing_address, email)
value
("Hidetaka Miyazaki","Sasazuka North Odakyu Bldg 2-26-2 Shibuya-ku, Sasaduka, Tokyo, 151-0073, Japan","Hidetaka.Miyazaki@gmail.com"),
("Tim Schafer", null,"tim.schafer@gmail.com"),
("Erik Wolpaw",null,"erik.Wolpaw@gmail.com")
;
select * from authors;
