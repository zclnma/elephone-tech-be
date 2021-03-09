create extension if not exists "uuid-ossp";

create table transaction_status_group
(
    id                 uuid not null,
    key                varchar(255) unique,
    display_name       varchar(255) unique,
    is_active          boolean,
    group_order        int4 unique,
    created_date       timestamp,
    last_modified_date timestamp,
    primary key (id)
);

insert into transaction_status_group(id, key, display_name, is_active, group_order, created_date, last_modified_date)
values ('08e11f20-5ef2-4da8-8a17-c2f05fa40b88', 'TO_BE_FIXED', 'To be fixed', true, 1, now(), now()),
       ('d34c9776-f40c-4aa6-9edd-e58caae3abdd', 'TO_BE_COLLECTED', 'To be collected', true, 2, now(), now()),
       ('1fe32dd9-986d-4d50-b8e9-ad9781e2cb77', 'FINALISED', 'Transaction finalised', true, 3, now(), now());

create table transaction_status
(
    id                          uuid    not null,
    key                         varchar(255) unique,
    display_name                varchar(255) unique,
    is_active                   boolean not null,
    is_default                  boolean not null,
    transaction_status_group_id uuid    not null,
    created_date                timestamp,
    last_modified_date          timestamp,
    primary key (id)
);

alter table if exists transaction_status
    add constraint FKpdwhddoyous87y01agj2t5kkb foreign key (transaction_status_group_id) references transaction_status_group;

insert into transaction_status(id, key, display_name, is_active, is_default, transaction_status_group_id, created_date,
                               last_modified_date)
values (uuid_generate_v4(), 'RECEIVED', 'Item received', true, true, '08e11f20-5ef2-4da8-8a17-c2f05fa40b88', now(),
        now()),
       (uuid_generate_v4(), 'IN_TRANSITION_TO_TECHNICIAN', 'In Transition to technician', true, false,
        '08e11f20-5ef2-4da8-8a17-c2f05fa40b88', now(), now()),
       (uuid_generate_v4(), 'RECEIVED_BY_TECHNICIAN', 'Received by technician, fix in queue', true, false,
        '08e11f20-5ef2-4da8-8a17-c2f05fa40b88', now(), now()),
       (uuid_generate_v4(), 'FIX_IN_PROGRESS', 'Repair in progress', true, false,
        '08e11f20-5ef2-4da8-8a17-c2f05fa40b88', now(), now()),
       (uuid_generate_v4(), 'IN_TRANSITION_TO_STORE', 'In transition to store', true, false,
        '08e11f20-5ef2-4da8-8a17-c2f05fa40b88', now(), now()),
       (uuid_generate_v4(), 'TO_BE_COLLECTED', 'Waiting to be collected', true, false,
        'd34c9776-f40c-4aa6-9edd-e58caae3abdd', now(), now()),
       (uuid_generate_v4(), 'FINALISED', 'Transaction finalised', true, false, '1fe32dd9-986d-4d50-b8e9-ad9781e2cb77',
        now(), now());

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


alter table move_path
    rename to transaction_transition;

create table transaction_action
(
    id                    uuid not null,
    employee_id           uuid not null,
    transaction_id        uuid not null,
    transaction_status_id uuid not null,
    created_date          timestamp,
    last_modified_date    timestamp,
    primary key (id)
);

alter table if exists transaction_action
    add constraint FKr7ou7832ed0m9j6q38scpavh5 foreign key (employee_id) references employee;
alter table if exists transaction_action
    add constraint FKe84ibdusucdhypomr22209o83 foreign key (transaction_id) references transaction;
alter table if exists transaction_action
    add constraint FKl8boshdk62kuuafax2504obgh foreign key (transaction_status_id) references transaction_status;

create table repair_type
(
    id                 uuid not null,
    key                varchar(255) unique,
    display_name       varchar(255) unique,
    is_active          boolean,
    created_date       timestamp,
    last_modified_date timestamp,
    primary key (id)
);

insert into repair_type(id, key, display_name, is_active, created_date, last_modified_date)
values (uuid_generate_v4(), 'SENSOR', 'Proximity Sensor', true, now(), now()),
       (uuid_generate_v4(), 'CAMERA', 'Front / Back Camera', true, now(), now()),
       (uuid_generate_v4(), 'EAR_SPEAKER', 'Ear Speaker', true, now(), now()),
       (uuid_generate_v4(), 'LOUD_SPEAKER', 'Loud Speaker', true, now(), now()),
       (uuid_generate_v4(), 'WIFI', 'Bluetooth / WIFI', true, now(), now()),
       (uuid_generate_v4(), 'LCD', 'LCD', true, now(), now()),
       (uuid_generate_v4(), 'MICROPHONE', 'Microphone', true, now(), now()),
       (uuid_generate_v4(), 'HOME', 'Home Button', true, now(), now()),
       (uuid_generate_v4(), 'ID', 'Face ID / Touch ID', true, now(), now()),
       (uuid_generate_v4(), 'VOLUME', 'Volume / Power Button', true, now(), now()),
       (uuid_generate_v4(), 'CHARGING', 'Charging', true, now(), now()),
       (uuid_generate_v4(), 'LIQUID', 'Liquid Damage', true, now(), now());
