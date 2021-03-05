create extension if not exists "uuid-ossp";

alter table elephone.public.comment
    alter column content type text;
alter table elephone.public.warranty_history
    alter column description type text;
alter table elephone.public.transaction
    alter column resolution type text;
alter table elephone.public.transaction
    alter column addition_info type text;

alter type transaction_status add value 'RECEIVED';
alter type transaction_status add value 'TO_BE_COLLECTED';

update transaction
set status = 'RECEIVED'
where transaction.status = 'WAIT';

update transaction
set status = 'TO_BE_COLLECTED'
where transaction.status = 'DONE';

create type transaction_status_group as enum ('TO_BE_FIXED','TO_BE_COLLECTED','FINALISED');
create type new_transaction_status as enum ('RECEIVED','IN_TRANSITION_TO_TECHNICIAN','RECEIVED_BY_TECHNICIAN','FIX_IN_PROGRESS','IN_TRANSITION_TO_STORE','TO_BE_COLLECTED','FINALISED');

create table transaction_status
(
    id          uuid not null,
    key         new_transaction_status,
    displayName varchar(255),
    group       transaction_status_group,
    primary key (id)
);

alter table transaction
    alter column status type new_transaction_status using (transaction.status::text::new_transaction_status);
drop type transaction_status;
alter type new_transaction_status rename to transaction_status;

insert into transaction_status(id, key, displayName, group)
values (uuid_generate_v4(), 'RECEIVED', 'Item received', 'TO_BE_FIXED'),
       (uuid_generate_v4(), 'IN_TRANSITION_TO_TECHNICIAN', 'In Transition to technician', 'TO_BE_FIXED'),
       (uuid_generate_v4(), 'RECEIVED_BY_TECHNICIAN', 'Received by technician, fix in queue', 'TO_BE_FIXED'),
       (uuid_generate_v4(), 'FIX_IN_PROGRESS', 'Repair in progress', 'TO_BE_FIXED'),
       (uuid_generate_v4(), 'IN_TRANSITION_TO_STORE', 'In transition to store', 'TO_BE_FIXED'),
       (uuid_generate_v4(), 'TO_BE_COLLECTED', 'Waiting to be collected', 'TO_BE_COLLECTED'),
       (uuid_generate_v4(), 'FINALISED', 'Transaction finalised', 'FINALISED');


alter table transaction
    add transaction_status_id uuid not null;

update transaction
set transaction_status_id = transaction_status.id
where transaction.status = transaction_status.key;

alter table transaction
    drop column status;
alter table transaction
    add constraint FK_transaction_transaction_tatus foreign key (transaction_status_id) references transaction_status;


