-- Daniel Marabito
create table Creative_Engagements (
Engagement_id int primary key auto_increment,
Product_id int not null,
author_id int not null,
earning_percentage float,
foreign key (product_id) references game(product_id), -- foreign keys for product_id and author_id
foreign key (author_id) references authors(author_id)
); 

insert into Creative_Engagements (product_id,author_id, earning_percentage)
values
(1,1, 100),
(2,2, 50), -- split it 50-50 among the listed authors
(2,3, 50),
(3,3, 100)
;

select * from creative_engagements;