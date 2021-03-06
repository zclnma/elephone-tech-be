create extension if not exists "uuid-ossp";

alter table elephone.public.comment
    alter column content type text;
alter table elephone.public.warranty_history
    alter column description type text;
alter table elephone.public.transaction
    alter column resolution type text;
alter table elephone.public.transaction
    alter column addition_info type text;

create table transaction_status_group
(
    id                 uuid not null,
    key                varchar(255),
    display_name       varchar(255),
    is_active          boolean,
    group_order        int4,
    created_date       timestamp default now(),
    last_modified_date timestamp default now(),
    primary key (id)
);

insert into transaction_status_group(id, key, display_name, is_active, group_order)
values ('08e11f20-5ef2-4da8-8a17-c2f05fa40b88', 'TO_BE_FIXED', 'To be fixed', true, 1),
       ('d34c9776-f40c-4aa6-9edd-e58caae3abdd', 'TO_BE_COLLECTED', 'To be collected', true, 2),
       ('1fe32dd9-986d-4d50-b8e9-ad9781e2cb77', 'FINALISED', 'Transaction finalised', true, 3);

create table transaction_status
(
    id                          uuid not null,
    key                         varchar(255),
    display_name                varchar(255),
    is_active                   boolean,
    is_default                  boolean,
    transaction_status_group_id uuid not null,
    created_date                timestamp,
    last_modified_date          timestamp,
    primary key (id)
);

alter table if exists transaction_status
    add constraint FKpdwhddoyous87y01agj2t5kkb foreign key (transaction_status_group_id) references transaction_status_group;

insert into transaction_status(id, key, display_name, is_active, is_default, transaction_status_group_id)
values (uuid_generate_v4(), 'RECEIVED', 'Item received', true, true, '08e11f20-5ef2-4da8-8a17-c2f05fa40b88'),
       (uuid_generate_v4(), 'IN_TRANSITION_TO_TECHNICIAN', 'In Transition to technician', true, false,
        '08e11f20-5ef2-4da8-8a17-c2f05fa40b88'),
       (uuid_generate_v4(), 'RECEIVED_BY_TECHNICIAN', 'Received by technician, fix in queue', true, false,
        '08e11f20-5ef2-4da8-8a17-c2f05fa40b88'),
       (uuid_generate_v4(), 'FIX_IN_PROGRESS', 'Repair in progress', true, false,
        '08e11f20-5ef2-4da8-8a17-c2f05fa40b88'),
       (uuid_generate_v4(), 'IN_TRANSITION_TO_STORE', 'In transition to store', true, false,
        '08e11f20-5ef2-4da8-8a17-c2f05fa40b88'),
       (uuid_generate_v4(), 'TO_BE_COLLECTED', 'Waiting to be collected', true, false,
        'd34c9776-f40c-4aa6-9edd-e58caae3abdd'),
       (uuid_generate_v4(), 'FINALISED', 'Transaction finalised', true, false, '1fe32dd9-986d-4d50-b8e9-ad9781e2cb77');

update transaction
set status = 'RECEIVED'
where transaction.status = 'WAIT';
update transaction
set status = 'TO_BE_COLLECTED'
where transaction.status = 'DONE';
alter table transaction
    add transaction_status_id uuid not null default uuid_generate_v4();

update transaction
set transaction_status_id = transaction_status.id
from transaction_status
where transaction.status = transaction_status.key;

alter table transaction
    drop column status;
alter table if exists transaction
    add constraint FKdb3nt6iipyx0tqg3synr73fpu foreign key (transaction_status_id) references transaction_status;




