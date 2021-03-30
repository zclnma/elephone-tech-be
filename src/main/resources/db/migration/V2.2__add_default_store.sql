alter table if exists employee add column default_store_id uuid;
alter table if exists employee add constraint FK3t903sui9eseq76xajvcnqln8 foreign key (default_store_id) references store