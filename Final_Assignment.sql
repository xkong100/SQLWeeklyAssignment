#1
drop schema if exists BuildingEnergy;
create schema BuildingEnergy;
use BuildingEnergy;


#2

DROP TABLE IF EXISTS EnergyCategories;
DROP TABLE IF EXISTS EnergyTypes;

CREATE TABLE EnergyCategories
(
  EnerCat_id int PRIMARY KEY,
  EnerCat varchar(30) NOT NULL
);
INSERT INTO EnergyCategories (EnerCat_id, EnerCat) VALUES (1, 'Fossil');
INSERT INTO EnergyCategories (EnerCat_id, EnerCat) VALUES (2, 'Renewable');

CREATE TABLE EnergyTypes
(
  EnerType_id int PRIMARY KEY,
  Ener_Type varchar(30) NOT NULL,
  EnerCat_id int references EnergyCategories(EnerCat_id)
);

INSERT INTO EnergyTypes (EnerType_id, Ener_Type, EnerCat_id) VALUES (1, 'Electricity', 1);
INSERT INTO EnergyTypes (EnerType_id, Ener_Type, EnerCat_id) VALUES (2, 'Gas', 1);
INSERT INTO EnergyTypes (EnerType_id, Ener_Type, EnerCat_id) VALUES (3, 'Steam', 1);
INSERT INTO EnergyTypes (EnerType_id, Ener_Type, EnerCat_id) VALUES (4, 'Fuel Oil', 1);
INSERT INTO EnergyTypes (EnerType_id, Ener_Type, EnerCat_id) VALUES (5, 'Solar', 2);
INSERT INTO EnergyTypes (EnerType_id, Ener_Type, EnerCat_id) VALUES (6, 'Wind', 2);

#3

Select Cat.EnerCat as 'EnergyCategory', T.Ener_Type as 'EnergyType' 
from EnergyTypes T 
Left join EnergyCategories Cat on T.EnerCat_id = Cat.EnerCat_id
order by Cat.EnerCat;

#4

DROP TABLE IF EXISTS Buildings;
DROP TABLE IF EXISTS Buildings_EnergyTypes;
CREATE TABLE Buildings
(
  Build_id int PRIMARY KEY,
  Build_name varchar(50) NOT NULL
);

INSERT INTO Buildings (Build_id, Build_name) VALUES (1, 'Empire State Building');
INSERT INTO Buildings (Build_id, Build_name) VALUES (2, 'Chrysler Building');
INSERT INTO Buildings (Build_id, Build_name) VALUES (3, 'Borough of Manhattan Community College');



CREATE TABLE Buildings_EnergyTypes
(
  Build_id int references Buildings(Build_id),
  EnerType_id int references EnergyTypes(Ener_Type_id)
);

INSERT INTO Buildings_EnergyTypes (Build_id, EnerType_id) VALUES (1, 1);
INSERT INTO Buildings_EnergyTypes (Build_id, EnerType_id) VALUES (1, 2);
INSERT INTO Buildings_EnergyTypes (Build_id, EnerType_id) VALUES (1, 3);

INSERT INTO Buildings_EnergyTypes (Build_id, EnerType_id) VALUES (2, 1);
INSERT INTO Buildings_EnergyTypes (Build_id, EnerType_id) VALUES (2, 3);

INSERT INTO Buildings_EnergyTypes (Build_id, EnerType_id) VALUES (3, 1);
INSERT INTO Buildings_EnergyTypes (Build_id, EnerType_id) VALUES (3, 3);
INSERT INTO Buildings_EnergyTypes (Build_id, EnerType_id) VALUES (3, 5);

#5
Select N.Build_name as 'Building', c.Ener_Type as 'EnergyType' 
from Buildings N 
Left join Buildings_EnergyTypes b on N.Build_id = b.Build_id
Left join EnergyTypes c on b.EnerType_id = c.EnerType_id;

#6

INSERT INTO Buildings (Build_id, Build_name) VALUES (4, 'Bronx Lion House');
INSERT INTO Buildings (Build_id, Build_name) VALUES (5, 'Brooklyn Childrens Museum');

INSERT INTO EnergyTypes (EnerType_id, Ener_Type, EnerCat_id) VALUES (7, 'Geothermal', 2);

INSERT INTO Buildings_EnergyTypes (Build_id, EnerType_id) VALUES (4, 7);
INSERT INTO Buildings_EnergyTypes (Build_id, EnerType_id) VALUES (5, 1);
INSERT INTO Buildings_EnergyTypes (Build_id, EnerType_id) VALUES (5, 7);

#7

Select N.Build_name as 'Building', b.Ener_Type as 'Energy Type', a.EnerCat as 'Energy Category' 
from EnergyCategories as a Left join EnergyTypes as b on a.EnerCat_id = b.EnerCat_id
						   Right Join Buildings_EnergyTypes as c on b.EnerType_id = c.EnerType_id 
                           Left Join Buildings as N on c.Build_id = N.Build_id
where a.EnerCat = 'Renewable';

#8

Select T.Ener_Type as 'EnergyType', count(*) as 'Frequency' 
from Buildings a 
Left join Buildings_EnergyTypes b on a.Build_id = b.Build_id
Left join EnergyTypes T on b.EnerType_id = T.EnerType_id
Group By T.Ener_Type
Order By count(*) Desc;

#9 
#a The foreign key constraint I have already put in the code. 
#b I will attach a scratch.
