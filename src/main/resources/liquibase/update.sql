--liquibase formatted sql logicalFilePath:update.sql

--changeset zmiter:added-users-table-2020-JAN-11-22-42
--comment Creating users table if not created by jpa
create table if not exists users (
 id bigserial not null constraint users_pkey primary key,
 email varchar(255) not null constraint unique_user_email unique,
 email_verified boolean not null,
 image_url varchar(255),
 name varchar(255) not null,
 password varchar(255),
 provider varchar(255) not null,
 provider_id varchar(255)
);

--changeset zmiter:added-categories-table-2020-JAN-11-23-22
--comment Creating categories table
create table if not exists categories (
 id bigserial not null constraint categories_pkey primary key,
 title varchar(255) not null
);

create table if not exists expenses (
 id bigserial not null constraint expenses_pkey primary key,
 title varchar(255) not null,
 description varchar(512) not null,
 purchase_date date not null,
 category_id bigserial not null references categories(id) on delete cascade,
 user_id bigserial not null references users(id) on delete cascade,
 amount int not null
);