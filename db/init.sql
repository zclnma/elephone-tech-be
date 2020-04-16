create table employee (id uuid not null, birthday timestamp, contact varchar(255), created_date int8 not null, email varchar(255), first_name varchar(255), gender int4, last_modified_date int8 not null, last_name varchar(255), status int4, tfn varchar(255), working_store_id uuid not null, primary key (id))
create table income (id uuid not null, cash int4, created_date int8 not null, efpos int4, last_modified_date int8 not null, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date int8 not null, last_modified_date int8 not null, role int4, sequence varchar(255), lat_end int4, lat_start int4, lng_end int4, lng_start int4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date int8 not null, customer_name varchar(255), device varchar(255), imei varchar(255), inspection boolean, is_finalised boolean, issue text, last_modified_date int8 not null, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), primary key (id))
create table work_history (id uuid not null, finish timestamp, start timestamp, employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee