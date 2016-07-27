DROP Table if exists users;
DROP Table if exists rooms;
Drop Table if exists groups;
Drop Table if exists users_groups_rooms;

Create table users(
	user_id int primary key,
    user varchar(30) Null
);

Insert into users(user_id, user) values (1, 'Modesto');
Insert into users(user_id, user) values (2, 'Ayine');
Insert into users(user_id, user) values (3, 'Christopher');
Insert into users(user_id, user) values (4, 'Cheong Woo');
Insert into users(user_id, user) values (5, 'Saulat');
Insert into users(user_id, user) values (6, 'Heidy');

Select * From users;

Create table groups(
	group_id int primary key,
    groups varchar(30) Null
);

Insert into groups (group_id, groups) values (1, 'I.T');
Insert into groups (group_id, groups) values (2, 'Sales');
Insert into groups (group_id, groups) values (3, 'Administration');
Insert into groups (group_id, groups) values (4, 'Operation');

Select * From groups;

Create table rooms(
	room_id int Primary key,
    room varchar(30) Null
);

Insert into rooms(room_id, room) Values (1, '101');
Insert into rooms(room_id, room) Values (2, '102');
Insert into rooms(room_id, room) Values (3, 'Auditorium A');
Insert into rooms(room_id, room) Values (4, 'Auditorium B');

Select * From rooms;

Create table users_groups_rooms(
	user_id int  references users(user_id),
    group_id int NULL references groups(group_id),
    room_id int NULL references rooms(room_id),
    unique Key (user_id, group_id, room_id)
);

Insert into users_groups_rooms (user_id, group_id, room_id) Values (1, 1, 1);
Insert into users_groups_rooms (user_id, group_id, room_id) Values (1, 1, 2);
Insert into users_groups_rooms (user_id, group_id, room_id) Values (2, 1, 1);
Insert into users_groups_rooms (user_id, group_id, room_id) Values (2, 1, 2);
Insert into users_groups_rooms (user_id, group_id, room_id) Values (3, 2, 2);
Insert into users_groups_rooms (user_id, group_id, room_id) Values (3, 2, 3);
Insert into users_groups_rooms (user_id, group_id, room_id) Values (4, 2, 2);
Insert into users_groups_rooms (user_id, group_id, room_id) Values (4, 2, 3);
Insert into users_groups_rooms (user_id, group_id, room_id) Values (5, 3, NULL);
Insert into users_groups_rooms (user_id, group_id, room_id) Values (6, NULL, NULL);


Select * From users_groups_rooms;

Select u.user, g.groups, r.room
	From users u LEFT JOIN users_groups_rooms ugr ON  u.user_id = ugr.user_id
				 LEFT JOIN groups g ON ugr.group_id = g.group_id
                 LEFT JOIN rooms  r ON ugr.room_id = r. room_id
	order by u.user, g.groups, r.room;