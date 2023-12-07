-- Daniel Marabito
/* Creating Tables*/
-- drop Associated tables first
drop table if exists sparkles;
drop table if exists spawns;
drop table if exists drops;
drop table if exists inventory;
-- enemies
drop table if exists enemies;

create table Enemies
(EnemyId int primary key auto_increment, Name varchar (50));

insert into Enemies (EnemyId, Name)
values
(1, 'Hollow'),
(2, 'Black Knight'),
(3, 'Skeleton'),
(4, 'Giant Leech')
;

-- items
drop table if exists items;
create table items
(itemId int  primary key auto_increment,  Name varchar (50), Description varchar (50));

insert into items
(itemId,  Name, Description)
values
(1, 'Soul of a lost undead', 'Some Souls'),
(2, 'Humanity', 'a drop of what makes a human a human.'),
(3, 'Black Knight Sword', 'A blade made for slaying'),
(4, 'Titanite Chunk', 'A Big rock used upgrade'),
(5, 'Shortbow', 'pew pew'),
(6,  'Large Titanite Shard', 'rock that is big but not the biggest'),
(7, 'Green Titanite Shard', 'Magic rock, glows green with power.');

-- Locations
drop table if exists locations;
create table locations
(LocationId int  primary key auto_increment, Name varchar(50), Description varchar(50));

insert into locations
values
(1, 'Northern Undead Asylum', 'The place mad men go to die.'),
(2, 'Firelink Shrine', 'Home sweet home.'),
(3, 'Undead burg', 'This dilapidated city is the home to undead.'),
(4, 'Blighttown', 'This dilapidated city is a health hazard.');

-- Players
drop table if exists players;
create table players
(PlayerId  int  primary key auto_increment, Name varchar(50));

insert into players
values
(1, 'GiantDad'),
(2, 'PraiseTheSun'),
(3, 'NoWalk'),
(4, 'Slayer1234');

-- spawns
create table spawns
(SpawnId int  primary key auto_increment, EnemyId int, LocationId int, BaseHp int, BaseSouls int, Respawn bool,
FOREIGN KEY (EnemyID) REFERENCES enemies(EnemyId),
FOREIGN KEY (LocationId) REFERENCES locations(LocationId));

insert into spawns
values
(1, 1, 1, 69, 20, true),
(2, 1, 3, 53, 20, true),
(3, 2, 1, 745, 1200, false),
(4, 2, 3, 497, 800, false);

-- Drops table
create table drops
(dropId int  primary key auto_increment, EnemyId int, itemId int, quantity int, dropRate decimal(8,6),
FOREIGN KEY (EnemyID) REFERENCES enemies(EnemyId),
FOREIGN KEY (itemID) REFERENCES items(itemID)
);

insert into drops
values
(1, 2, 3, 1, 0.2),
(2, 2, 4, 1, 1),
(3, 1, 5,  1, 0.02),
(4, 3, 5,  1,  0.02),
(5, 4, 6, 1, 0.0515),
(6, 4, 7, 5, 0.0206);

-- sparkles
create table sparkles
(SparklesId int  primary key auto_increment, ItemId int, LocationId int,FOREIGN KEY (itemID) REFERENCES items(itemID), FOREIGN KEY (LocationId) REFERENCES locations(LocationId));

insert into sparkles
values
(1, 1, 1),
(2, 1, 3),
(3, 2, 2),
(4, 2, 3);

-- inventory
create table inventory
(InventoryId int primary key auto_increment, PlayerId int, ItemId int, Quantity int, FOREIGN KEY (PlayerId) REFERENCES players(PlayerId), FOREIGN KEY (itemID) REFERENCES items(itemID));

insert into inventory
values
(1, 1, 1, 10),
(2, 2, 1, 5),
(3, 1, 2, 3),
(4,  2, 2, 12);