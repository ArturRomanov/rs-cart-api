create table if not exists carts (
id uuid not null default gen_random_uuid() primary key,
created_at date not null default current_timestamp,
updated_at date not null default current_timestamp
);

create table if not exists cart_items (
cart_id uuid not null references carts(id) on update cascade on delete cascade,
product_id uuid not null,
count int
);

insert into carts default values;
insert into cart_items (cart_id, product_id, count) values ((select id from carts limit 1), gen_random_uuid(), 197);

create table if not exists orders (
id uuid,
user_id uuid,
cart_id uuid references carts(id),
payment varchar(500),
delivery varchar(500),
comments varchar(500),
status varchar(500),
total int
);