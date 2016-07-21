CREATE TABLE Video
(
ID int,
Title varchar(255) NOT NULL,
Length varchar(255),
URL varchar(255),
PRIMARY KEY (ID)
);

INSERT INTO Video (ID,Title, Length, URL) VALUES (1,'Casually Explained: Social Media', '3:10', 'https://www.youtube.com/watch?v=6qw0L0Pv12w');
INSERT INTO Video (ID,Title, Length, URL) VALUES (2,'Pokemon Go In Real Life', '2:43', 'https://www.youtube.com/watch?v=GjOeZ2xk96Y');
INSERT INTO Video (ID,Title, Length, URL) VALUES (3,'Coldplay - Up&Up', '4:10', 'https://www.youtube.com/watch?v=BPNTC7uZYrI');

Select * From Video;


CREATE TABLE Reviews
(
UserName varchar(255),
Rating int default null,
review varchar(255),
ID int not null references Video
);

Insert into Reviews (UserName, Rating,review, ID) Values ('Felix', 5, 'Funny video', 1);
Insert into Reviews (UserName, Rating,review, ID) Values ('Henry',2, 'Not True',1);
Insert into Reviews (UserName, Rating,review, ID) Values ('KK23', 4, 'Big fan of Casey',2);
Insert into Reviews (UserName, Rating,review, ID) Values  ('jolin', 5, 'Love the game', 2);
Insert into Reviews (UserName, Rating,review, ID) Values ('Vivian', 5, 'Great Song', 3);
Insert into Reviews (UserName, Rating,review, ID) Values ('Herna', 5, 'Love them', 3);

select*from Reviews;

Select Video.Title, Video.Length, Video.URL, Reviews.UserName, Reviews.Rating, Reviews.review
From Video
Left join Reviews
On Video.ID = Reviews.ID
Order by Video.ID;