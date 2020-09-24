create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), employee_id uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKdy6g6syi6g7v45nodi0whyy76 foreign key (employee_id) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), working_store_id uuid, primary key (id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, last_modified_date timestamp, name varchar(255), password varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table store_employee (store_id uuid not null, employee_id uuid not null, primary key (store_id, employee_id))
create table transaction (id uuid not null, color varchar(255), condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
create table work_history (id uuid not null, created_date timestamp, finish varchar(255), last_modified_date timestamp, start varchar(255), employee_id uuid not null, primary key (id))
alter table if exists employee add constraint FKid5aqtc2af5yoif4a905xpvsh foreign key (working_store_id) references store
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists store_employee add constraint FKaiarlsd3an33ej4om56tjs677 foreign key (employee_id) references employee
alter table if exists store_employee add constraint FKtafd4sk846bi7lgvv0q5wegnb foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists work_history add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee
