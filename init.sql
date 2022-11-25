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