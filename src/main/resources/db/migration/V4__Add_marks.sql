create table message_likes
(
    user_id    bigint not null references usr,
    message_id bigint not null references message,
    primary key (user_id, message_id)
);

create table message_dislikes
(
    user_id    bigint not null references usr,
    message_id bigint not null references message,
    primary key (user_id, message_id)
);

create table comment_likes
(
    user_id    bigint not null references usr,
    comment_id bigint not null references comment,
    primary key (user_id, comment_id)
);

create table comment_dislikes
(
    user_id    bigint not null references usr,
    comment_id bigint not null references comment,
    primary key (user_id, comment_id)
);
