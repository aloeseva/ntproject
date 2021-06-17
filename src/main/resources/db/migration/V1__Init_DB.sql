-- -----------------------------------------------------
-- Table `hibernate_sequence`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS hibernate_sequence
(
    `next_val` BIGINT NOT NULL
)
    AUTO_INCREMENT = 1;

insert into hibernate_sequence (next_val)
values (1);
-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS usr
(
    `id`          BIGINT       NOT NULL,
    `active_code` VARCHAR(255),
    `active`      BOOLEAN      NOT NULL,
    `email`       VARCHAR(255),
    `password`    VARCHAR(255) NOT NULL,
    `username`    VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`)
);

-- -----------------------------------------------------
-- Table `message`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS message
(
    `id`        BIGINT        NOT NULL,
    `post_date` DATETIME,
    `tag`       VARCHAR(255),
    `text`      VARCHAR(2048) NOT NULL,
    `user_id`   BIGINT,
    PRIMARY KEY (`id`),
    INDEX massage_user_fk (`user_id` ASC),
    CONSTRAINT massage_user_fk
        FOREIGN KEY (`user_id`)
            REFERENCES usr (`id`) on delete cascade
);

-- -----------------------------------------------------
-- Table `message`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS comment
(
    `id`         BIGINT        NOT NULL,
    `text`       VARCHAR(2048) NOT NULL,
    `user_id`    BIGINT,
    `message_id` BIGINT,
    PRIMARY KEY (`id`),
    INDEX comment_user_fk (`user_id` ASC),
    CONSTRAINT comment_user_fk
        FOREIGN KEY (`user_id`)
            REFERENCES usr (`id`) on delete cascade,
    INDEX comment_message_fk (`message_id` ASC),
    CONSTRAINT comment_message_fk
        FOREIGN KEY (`message_id`)
            REFERENCES message (`id`) on delete cascade
);

-- -----------------------------------------------------
-- Table `user_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS user_role
(
    `user_id` BIGINT NOT NULL,
    `roles`   VARCHAR(255),
    INDEX user_role_user_fk (`user_id` ASC),
    CONSTRAINT user_role_user_fk
        FOREIGN KEY (`user_id`)
            REFERENCES usr (`id`)
);
