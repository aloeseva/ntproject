insert into usr (id, username, password, active)
values (1, 'admin', '$2a$08$pKe3uV5kSb358BIotDLRhOOVSqNKvNVbiqpS/CSYyJjVc0MvF8xyG', true);

insert into user_role (user_id, roles)
values (1, 'USER'),
       (1, 'ADMIN');

insert into usr (id, username, password, active)
values (2, 'u', '$2a$08$pKe3uV5kSb358BIotDLRhOOVSqNKvNVbiqpS/CSYyJjVc0MvF8xyG', true);

insert into user_role (user_id, roles)
values (2, 'USER');

insert into usr (id, username, password, active)
values (3, 'u1', '$2a$08$pKe3uV5kSb358BIotDLRhOOVSqNKvNVbiqpS/CSYyJjVc0MvF8xyG', true);

insert into user_role (user_id, roles)
values (3, 'USER');
