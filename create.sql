create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender varchar(255), is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role varchar(255), tfn varchar(255), username varchar(255), primary key (id))
create table employee_stores (employee_id uuid not null, stores_id uuid not null)
create table move_path (id uuid not null, created_date timestamp, last_modified_date timestamp, store_id uuid not null, transaction_id uuid not null, move_path_order int4, primary key (id))
create table store (id uuid not null, abn varchar(255), address varchar(255), company_name varchar(255), contact varchar(255), created_date timestamp, deleted_at timestamp, email varchar(255), is_deleted boolean, last_modified_date timestamp, name varchar(255), postcode varchar(255), reference int4, sequence serial, state varchar(255), suburb varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), auth_signature TEXT, battery varchar(255), color varchar(255), product_condition varchar(255), conf_signature TEXT, contact varchar(255), created_date timestamp, customer_name varchar(255), deposit varchar(255), device varchar(255), email varchar(255), finalised_time timestamp, imei varchar(255), is_deleted boolean, issue TEXT, last_modified_date timestamp, notification_method varchar(255), passcode varchar(255), pickup_time varchar(255), reference varchar(255), resolution varchar(255), status varchar(255), created_by uuid, finalised_by uuid, init_store_id uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
create table warranty_history (id uuid not null, created_date timestamp, description varchar(255), last_modified_date timestamp, employee_id uuid not null, store_id uuid not null, transaction_id uuid not null, primary key (id))
alter table if exists employee_stores add constraint UK_beripoopjvqmf3o7uu0n33hly unique (stores_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists transaction add constraint UK_ea0sj0oja3gyf9tj6v9n3ftjk unique (reference)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_stores add constraint FK30a4v5jchamkalulhsotfpvga foreign key (stores_id) references store
alter table if exists employee_stores add constraint FKo7cm2j8thu3u4p6bv7jwi4jnm foreign key (employee_id) references employee
alter table if exists move_path add constraint FKcfsnatmbgcktd3nbcda2mchv5 foreign key (store_id) references store
alter table if exists move_path add constraint FK5nglfbfoohp6tfdpa51gm82h5 foreign key (transaction_id) references transaction
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FKkwnf760xnl07l48nkelkaeip7 foreign key (init_store_id) references store
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists warranty_history add constraint FKhywddk1u6fgakdxpr0jiikyxx foreign key (employee_id) references employee
alter table if exists warranty_history add constraint FKj7af5lq0ptudgvsid4xa5d1o7 foreign key (store_id) references store
alter table if exists warranty_history add constraint FKd79psq2yqp7y0hmairff4h4of foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender varchar(255), is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role varchar(255), tfn varchar(255), username varchar(255), primary key (id))
create table employee_stores (employee_id uuid not null, stores_id uuid not null)
create table move_path (id uuid not null, created_date timestamp, last_modified_date timestamp, store_id uuid not null, transaction_id uuid not null, move_path_order int4, primary key (id))
create table store (id uuid not null, abn varchar(255), address varchar(255), company_name varchar(255), contact varchar(255), created_date timestamp, deleted_at timestamp, email varchar(255), is_deleted boolean, last_modified_date timestamp, name varchar(255), postcode varchar(255), reference int4, sequence serial, state varchar(255), suburb varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), auth_signature TEXT, battery varchar(255), color varchar(255), product_condition varchar(255), conf_signature TEXT, contact varchar(255), created_date timestamp, customer_name varchar(255), deposit varchar(255), device varchar(255), email varchar(255), finalised_time timestamp, imei varchar(255), is_deleted boolean, issue TEXT, last_modified_date timestamp, notification_method varchar(255), passcode varchar(255), pickup_time varchar(255), reference varchar(255), resolution varchar(255), status varchar(255), created_by uuid, finalised_by uuid, init_store_id uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
create table warranty_history (id uuid not null, created_date timestamp, description varchar(255), last_modified_date timestamp, employee_id uuid not null, store_id uuid not null, transaction_id uuid not null, primary key (id))
alter table if exists employee_stores add constraint UK_beripoopjvqmf3o7uu0n33hly unique (stores_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists transaction add constraint UK_ea0sj0oja3gyf9tj6v9n3ftjk unique (reference)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_stores add constraint FK30a4v5jchamkalulhsotfpvga foreign key (stores_id) references store
alter table if exists employee_stores add constraint FKo7cm2j8thu3u4p6bv7jwi4jnm foreign key (employee_id) references employee
alter table if exists move_path add constraint FKcfsnatmbgcktd3nbcda2mchv5 foreign key (store_id) references store
alter table if exists move_path add constraint FK5nglfbfoohp6tfdpa51gm82h5 foreign key (transaction_id) references transaction
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FKkwnf760xnl07l48nkelkaeip7 foreign key (init_store_id) references store
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists warranty_history add constraint FKhywddk1u6fgakdxpr0jiikyxx foreign key (employee_id) references employee
alter table if exists warranty_history add constraint FKj7af5lq0ptudgvsid4xa5d1o7 foreign key (store_id) references store
alter table if exists warranty_history add constraint FKd79psq2yqp7y0hmairff4h4of foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender varchar(255), is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role varchar(255), tfn varchar(255), username varchar(255), primary key (id))
create table employee_stores (employee_id uuid not null, stores_id uuid not null)
create table move_path (id uuid not null, created_date timestamp, last_modified_date timestamp, store_id uuid not null, transaction_id uuid not null, move_path_order int4, primary key (id))
create table store (id uuid not null, abn varchar(255), address varchar(255), company_name varchar(255), contact varchar(255), created_date timestamp, deleted_at timestamp, email varchar(255), is_deleted boolean, last_modified_date timestamp, name varchar(255), postcode varchar(255), reference int4, sequence serial, state varchar(255), suburb varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), auth_signature TEXT, battery varchar(255), color varchar(255), product_condition varchar(255), conf_signature TEXT, contact varchar(255), created_date timestamp, customer_name varchar(255), deposit varchar(255), device varchar(255), email varchar(255), finalised_time timestamp, imei varchar(255), is_deleted boolean, issue TEXT, last_modified_date timestamp, notification_method varchar(255), passcode varchar(255), pickup_time varchar(255), reference varchar(255), resolution varchar(255), status varchar(255), created_by uuid, finalised_by uuid, init_store_id uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
create table warranty_history (id uuid not null, created_date timestamp, description varchar(255), last_modified_date timestamp, employee_id uuid not null, store_id uuid not null, transaction_id uuid not null, primary key (id))
alter table if exists employee_stores add constraint UK_beripoopjvqmf3o7uu0n33hly unique (stores_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists transaction add constraint UK_ea0sj0oja3gyf9tj6v9n3ftjk unique (reference)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_stores add constraint FK30a4v5jchamkalulhsotfpvga foreign key (stores_id) references store
alter table if exists employee_stores add constraint FKo7cm2j8thu3u4p6bv7jwi4jnm foreign key (employee_id) references employee
alter table if exists move_path add constraint FKcfsnatmbgcktd3nbcda2mchv5 foreign key (store_id) references store
alter table if exists move_path add constraint FK5nglfbfoohp6tfdpa51gm82h5 foreign key (transaction_id) references transaction
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FKkwnf760xnl07l48nkelkaeip7 foreign key (init_store_id) references store
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists warranty_history add constraint FKhywddk1u6fgakdxpr0jiikyxx foreign key (employee_id) references employee
alter table if exists warranty_history add constraint FKj7af5lq0ptudgvsid4xa5d1o7 foreign key (store_id) references store
alter table if exists warranty_history add constraint FKd79psq2yqp7y0hmairff4h4of foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender varchar(255), is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role varchar(255), tfn varchar(255), username varchar(255), primary key (id))
create table employee_stores (employee_id uuid not null, stores_id uuid not null)
create table move_path (id uuid not null, created_date timestamp, last_modified_date timestamp, store_id uuid not null, transaction_id uuid not null, move_path_order int4, primary key (id))
create table store (id uuid not null, abn varchar(255), address varchar(255), company_name varchar(255), contact varchar(255), created_date timestamp, deleted_at timestamp, email varchar(255), is_deleted boolean, last_modified_date timestamp, name varchar(255), postcode varchar(255), reference int4, sequence serial, state varchar(255), suburb varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), auth_signature TEXT, battery varchar(255), color varchar(255), product_condition varchar(255), conf_signature TEXT, contact varchar(255), created_date timestamp, customer_name varchar(255), deposit varchar(255), device varchar(255), email varchar(255), finalised_time timestamp, imei varchar(255), is_deleted boolean, issue TEXT, last_modified_date timestamp, notification_method varchar(255), passcode varchar(255), pickup_time varchar(255), reference varchar(255), resolution varchar(255), status varchar(255), created_by uuid, finalised_by uuid, init_store_id uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
create table warranty_history (id uuid not null, created_date timestamp, description varchar(255), last_modified_date timestamp, employee_id uuid not null, store_id uuid not null, transaction_id uuid not null, primary key (id))
alter table if exists employee_stores add constraint UK_beripoopjvqmf3o7uu0n33hly unique (stores_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists transaction add constraint UK_ea0sj0oja3gyf9tj6v9n3ftjk unique (reference)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_stores add constraint FK30a4v5jchamkalulhsotfpvga foreign key (stores_id) references store
alter table if exists employee_stores add constraint FKo7cm2j8thu3u4p6bv7jwi4jnm foreign key (employee_id) references employee
alter table if exists move_path add constraint FKcfsnatmbgcktd3nbcda2mchv5 foreign key (store_id) references store
alter table if exists move_path add constraint FK5nglfbfoohp6tfdpa51gm82h5 foreign key (transaction_id) references transaction
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FKkwnf760xnl07l48nkelkaeip7 foreign key (init_store_id) references store
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists warranty_history add constraint FKhywddk1u6fgakdxpr0jiikyxx foreign key (employee_id) references employee
alter table if exists warranty_history add constraint FKj7af5lq0ptudgvsid4xa5d1o7 foreign key (store_id) references store
alter table if exists warranty_history add constraint FKd79psq2yqp7y0hmairff4h4of foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender varchar(255), is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role varchar(255), tfn varchar(255), username varchar(255), primary key (id))
create table employee_stores (employee_id uuid not null, stores_id uuid not null)
create table move_path (id uuid not null, created_date timestamp, last_modified_date timestamp, store_id uuid not null, transaction_id uuid not null, move_path_order int4, primary key (id))
create table store (id uuid not null, abn varchar(255), address varchar(255), company_name varchar(255), contact varchar(255), created_date timestamp, deleted_at timestamp, email varchar(255), is_deleted boolean, last_modified_date timestamp, name varchar(255), postcode varchar(255), reference int4, sequence serial, state varchar(255), suburb varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), auth_signature TEXT, battery varchar(255), color varchar(255), product_condition varchar(255), conf_signature TEXT, contact varchar(255), created_date timestamp, customer_name varchar(255), deposit varchar(255), device varchar(255), email varchar(255), finalised_time timestamp, imei varchar(255), is_deleted boolean, issue TEXT, last_modified_date timestamp, notification_method varchar(255), passcode varchar(255), pickup_time varchar(255), reference varchar(255), resolution varchar(255), status varchar(255), created_by uuid, finalised_by uuid, init_store_id uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
create table warranty_history (id uuid not null, created_date timestamp, description varchar(255), last_modified_date timestamp, employee_id uuid not null, store_id uuid not null, transaction_id uuid not null, primary key (id))
alter table if exists employee_stores add constraint UK_beripoopjvqmf3o7uu0n33hly unique (stores_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists transaction add constraint UK_ea0sj0oja3gyf9tj6v9n3ftjk unique (reference)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_stores add constraint FK30a4v5jchamkalulhsotfpvga foreign key (stores_id) references store
alter table if exists employee_stores add constraint FKo7cm2j8thu3u4p6bv7jwi4jnm foreign key (employee_id) references employee
alter table if exists move_path add constraint FKcfsnatmbgcktd3nbcda2mchv5 foreign key (store_id) references store
alter table if exists move_path add constraint FK5nglfbfoohp6tfdpa51gm82h5 foreign key (transaction_id) references transaction
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FKkwnf760xnl07l48nkelkaeip7 foreign key (init_store_id) references store
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists warranty_history add constraint FKhywddk1u6fgakdxpr0jiikyxx foreign key (employee_id) references employee
alter table if exists warranty_history add constraint FKj7af5lq0ptudgvsid4xa5d1o7 foreign key (store_id) references store
alter table if exists warranty_history add constraint FKd79psq2yqp7y0hmairff4h4of foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender varchar(255), is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role varchar(255), tfn varchar(255), username varchar(255), primary key (id))
create table employee_stores (employee_id uuid not null, stores_id uuid not null)
create table move_path (id uuid not null, created_date timestamp, last_modified_date timestamp, store_id uuid not null, transaction_id uuid not null, move_path_order int4, primary key (id))
create table store (id uuid not null, abn varchar(255), address varchar(255), company_name varchar(255), contact varchar(255), created_date timestamp, deleted_at timestamp, email varchar(255), is_deleted boolean, last_modified_date timestamp, name varchar(255), postcode varchar(255), reference int4, sequence serial, state varchar(255), suburb varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), auth_signature TEXT, battery varchar(255), color varchar(255), product_condition varchar(255), conf_signature TEXT, contact varchar(255), created_date timestamp, customer_name varchar(255), deposit varchar(255), device varchar(255), email varchar(255), finalised_time timestamp, imei varchar(255), is_deleted boolean, issue TEXT, last_modified_date timestamp, notification_method varchar(255), passcode varchar(255), pickup_time varchar(255), reference varchar(255), resolution varchar(255), status varchar(255), created_by uuid, finalised_by uuid, init_store_id uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
create table warranty_history (id uuid not null, created_date timestamp, description varchar(255), last_modified_date timestamp, employee_id uuid not null, store_id uuid not null, transaction_id uuid not null, primary key (id))
alter table if exists employee_stores add constraint UK_beripoopjvqmf3o7uu0n33hly unique (stores_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists transaction add constraint UK_ea0sj0oja3gyf9tj6v9n3ftjk unique (reference)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_stores add constraint FK30a4v5jchamkalulhsotfpvga foreign key (stores_id) references store
alter table if exists employee_stores add constraint FKo7cm2j8thu3u4p6bv7jwi4jnm foreign key (employee_id) references employee
alter table if exists move_path add constraint FKcfsnatmbgcktd3nbcda2mchv5 foreign key (store_id) references store
alter table if exists move_path add constraint FK5nglfbfoohp6tfdpa51gm82h5 foreign key (transaction_id) references transaction
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FKkwnf760xnl07l48nkelkaeip7 foreign key (init_store_id) references store
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists warranty_history add constraint FKhywddk1u6fgakdxpr0jiikyxx foreign key (employee_id) references employee
alter table if exists warranty_history add constraint FKj7af5lq0ptudgvsid4xa5d1o7 foreign key (store_id) references store
alter table if exists warranty_history add constraint FKd79psq2yqp7y0hmairff4h4of foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender varchar(255), is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role varchar(255), tfn varchar(255), username varchar(255), primary key (id))
create table employee_stores (employee_id uuid not null, stores_id uuid not null)
create table move_path (id uuid not null, created_date timestamp, last_modified_date timestamp, store_id uuid not null, transaction_id uuid not null, move_path_order int4, primary key (id))
create table store (id uuid not null, abn varchar(255), address varchar(255), company_name varchar(255), contact varchar(255), created_date timestamp, deleted_at timestamp, email varchar(255), is_deleted boolean, last_modified_date timestamp, name varchar(255), postcode varchar(255), reference int4, sequence serial, state varchar(255), suburb varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), auth_signature TEXT, battery varchar(255), color varchar(255), product_condition varchar(255), conf_signature TEXT, contact varchar(255), created_date timestamp, customer_name varchar(255), deposit varchar(255), device varchar(255), email varchar(255), finalised_time timestamp, imei varchar(255), is_deleted boolean, issue TEXT, last_modified_date timestamp, notification_method varchar(255), passcode varchar(255), pickup_time varchar(255), reference varchar(255), resolution varchar(255), status varchar(255), created_by uuid, finalised_by uuid, init_store_id uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
create table warranty_history (id uuid not null, created_date timestamp, description varchar(255), last_modified_date timestamp, employee_id uuid not null, store_id uuid not null, transaction_id uuid not null, primary key (id))
alter table if exists employee_stores add constraint UK_beripoopjvqmf3o7uu0n33hly unique (stores_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists transaction add constraint UK_ea0sj0oja3gyf9tj6v9n3ftjk unique (reference)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_stores add constraint FK30a4v5jchamkalulhsotfpvga foreign key (stores_id) references store
alter table if exists employee_stores add constraint FKo7cm2j8thu3u4p6bv7jwi4jnm foreign key (employee_id) references employee
alter table if exists move_path add constraint FKcfsnatmbgcktd3nbcda2mchv5 foreign key (store_id) references store
alter table if exists move_path add constraint FK5nglfbfoohp6tfdpa51gm82h5 foreign key (transaction_id) references transaction
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FKkwnf760xnl07l48nkelkaeip7 foreign key (init_store_id) references store
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists warranty_history add constraint FKhywddk1u6fgakdxpr0jiikyxx foreign key (employee_id) references employee
alter table if exists warranty_history add constraint FKj7af5lq0ptudgvsid4xa5d1o7 foreign key (store_id) references store
alter table if exists warranty_history add constraint FKd79psq2yqp7y0hmairff4h4of foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender varchar(255), is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role varchar(255), tfn varchar(255), username varchar(255), primary key (id))
create table employee_stores (employee_id uuid not null, stores_id uuid not null)
create table move_path (id uuid not null, created_date timestamp, last_modified_date timestamp, store_id uuid not null, transaction_id uuid not null, move_path_order int4, primary key (id))
create table store (id uuid not null, abn varchar(255), address varchar(255), company_name varchar(255), contact varchar(255), created_date timestamp, deleted_at timestamp, email varchar(255), is_deleted boolean, last_modified_date timestamp, name varchar(255), postcode varchar(255), reference int4, sequence serial, state varchar(255), suburb varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), auth_signature TEXT, battery varchar(255), color varchar(255), product_condition varchar(255), conf_signature TEXT, contact varchar(255), created_date timestamp, customer_name varchar(255), deposit varchar(255), device varchar(255), email varchar(255), finalised_time timestamp, imei varchar(255), is_deleted boolean, issue TEXT, last_modified_date timestamp, notification_method varchar(255), passcode varchar(255), pickup_time varchar(255), reference varchar(255), resolution varchar(255), status varchar(255), created_by uuid, finalised_by uuid, init_store_id uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
create table warranty_history (id uuid not null, created_date timestamp, description varchar(255), last_modified_date timestamp, employee_id uuid not null, store_id uuid not null, transaction_id uuid not null, primary key (id))
alter table if exists employee_stores add constraint UK_beripoopjvqmf3o7uu0n33hly unique (stores_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists transaction add constraint UK_ea0sj0oja3gyf9tj6v9n3ftjk unique (reference)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_stores add constraint FK30a4v5jchamkalulhsotfpvga foreign key (stores_id) references store
alter table if exists employee_stores add constraint FKo7cm2j8thu3u4p6bv7jwi4jnm foreign key (employee_id) references employee
alter table if exists move_path add constraint FKcfsnatmbgcktd3nbcda2mchv5 foreign key (store_id) references store
alter table if exists move_path add constraint FK5nglfbfoohp6tfdpa51gm82h5 foreign key (transaction_id) references transaction
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FKkwnf760xnl07l48nkelkaeip7 foreign key (init_store_id) references store
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists warranty_history add constraint FKhywddk1u6fgakdxpr0jiikyxx foreign key (employee_id) references employee
alter table if exists warranty_history add constraint FKj7af5lq0ptudgvsid4xa5d1o7 foreign key (store_id) references store
alter table if exists warranty_history add constraint FKd79psq2yqp7y0hmairff4h4of foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender varchar(255), is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role varchar(255), tfn varchar(255), username varchar(255), primary key (id))
create table employee_stores (employee_id uuid not null, stores_id uuid not null)
create table move_path (id uuid not null, created_date timestamp, last_modified_date timestamp, store_id uuid not null, transaction_id uuid not null, move_path_order int4, primary key (id))
create table store (id uuid not null, abn varchar(255), address varchar(255), company_name varchar(255), contact varchar(255), created_date timestamp, deleted_at timestamp, email varchar(255), is_deleted boolean, last_modified_date timestamp, name varchar(255), postcode varchar(255), reference int4, sequence serial, state varchar(255), suburb varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), auth_signature TEXT, battery varchar(255), color varchar(255), product_condition varchar(255), conf_signature TEXT, contact varchar(255), created_date timestamp, customer_name varchar(255), deposit varchar(255), device varchar(255), email varchar(255), finalised_time timestamp, imei varchar(255), is_deleted boolean, issue TEXT, last_modified_date timestamp, notification_method varchar(255), passcode varchar(255), pickup_time varchar(255), reference varchar(255), resolution varchar(255), status varchar(255), created_by uuid, finalised_by uuid, init_store_id uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
create table warranty_history (id uuid not null, created_date timestamp, description varchar(255), last_modified_date timestamp, employee_id uuid not null, store_id uuid not null, transaction_id uuid not null, primary key (id))
alter table if exists employee_stores add constraint UK_beripoopjvqmf3o7uu0n33hly unique (stores_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists transaction add constraint UK_ea0sj0oja3gyf9tj6v9n3ftjk unique (reference)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_stores add constraint FK30a4v5jchamkalulhsotfpvga foreign key (stores_id) references store
alter table if exists employee_stores add constraint FKo7cm2j8thu3u4p6bv7jwi4jnm foreign key (employee_id) references employee
alter table if exists move_path add constraint FKcfsnatmbgcktd3nbcda2mchv5 foreign key (store_id) references store
alter table if exists move_path add constraint FK5nglfbfoohp6tfdpa51gm82h5 foreign key (transaction_id) references transaction
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FKkwnf760xnl07l48nkelkaeip7 foreign key (init_store_id) references store
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists warranty_history add constraint FKhywddk1u6fgakdxpr0jiikyxx foreign key (employee_id) references employee
alter table if exists warranty_history add constraint FKj7af5lq0ptudgvsid4xa5d1o7 foreign key (store_id) references store
alter table if exists warranty_history add constraint FKd79psq2yqp7y0hmairff4h4of foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender varchar(255), is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role varchar(255), tfn varchar(255), username varchar(255), primary key (id))
create table employee_stores (employee_id uuid not null, stores_id uuid not null)
create table move_path (id uuid not null, created_date timestamp, last_modified_date timestamp, store_id uuid not null, transaction_id uuid not null, move_path_order int4, primary key (id))
create table store (id uuid not null, abn varchar(255), address varchar(255), company_name varchar(255), contact varchar(255), created_date timestamp, deleted_at timestamp, email varchar(255), is_deleted boolean, last_modified_date timestamp, name varchar(255), postcode varchar(255), reference int4, sequence serial, state varchar(255), suburb varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), auth_signature TEXT, battery varchar(255), color varchar(255), product_condition varchar(255), conf_signature TEXT, contact varchar(255), created_date timestamp, customer_name varchar(255), deposit varchar(255), device varchar(255), email varchar(255), finalised_time timestamp, imei varchar(255), is_deleted boolean, issue TEXT, last_modified_date timestamp, notification_method varchar(255), passcode varchar(255), pickup_time varchar(255), reference varchar(255), resolution varchar(255), status varchar(255), created_by uuid, finalised_by uuid, init_store_id uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
create table warranty_history (id uuid not null, created_date timestamp, description varchar(255), last_modified_date timestamp, employee_id uuid not null, store_id uuid not null, transaction_id uuid not null, primary key (id))
alter table if exists employee_stores add constraint UK_beripoopjvqmf3o7uu0n33hly unique (stores_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists transaction add constraint UK_ea0sj0oja3gyf9tj6v9n3ftjk unique (reference)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_stores add constraint FK30a4v5jchamkalulhsotfpvga foreign key (stores_id) references store
alter table if exists employee_stores add constraint FKo7cm2j8thu3u4p6bv7jwi4jnm foreign key (employee_id) references employee
alter table if exists move_path add constraint FKcfsnatmbgcktd3nbcda2mchv5 foreign key (store_id) references store
alter table if exists move_path add constraint FK5nglfbfoohp6tfdpa51gm82h5 foreign key (transaction_id) references transaction
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FKkwnf760xnl07l48nkelkaeip7 foreign key (init_store_id) references store
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists warranty_history add constraint FKhywddk1u6fgakdxpr0jiikyxx foreign key (employee_id) references employee
alter table if exists warranty_history add constraint FKj7af5lq0ptudgvsid4xa5d1o7 foreign key (store_id) references store
alter table if exists warranty_history add constraint FKd79psq2yqp7y0hmairff4h4of foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender varchar(255), is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role varchar(255), tfn varchar(255), username varchar(255), primary key (id))
create table employee_stores (employee_id uuid not null, stores_id uuid not null)
create table move_path (id uuid not null, created_date timestamp, last_modified_date timestamp, store_id uuid not null, transaction_id uuid not null, move_path_order int4, primary key (id))
create table store (id uuid not null, abn varchar(255), address varchar(255), company_name varchar(255), contact varchar(255), created_date timestamp, deleted_at timestamp, email varchar(255), is_deleted boolean, last_modified_date timestamp, name varchar(255), postcode varchar(255), reference int4, sequence serial, state varchar(255), suburb varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), auth_signature TEXT, battery varchar(255), color varchar(255), product_condition varchar(255), conf_signature TEXT, contact varchar(255), created_date timestamp, customer_name varchar(255), deposit varchar(255), device varchar(255), email varchar(255), finalised_time timestamp, imei varchar(255), is_deleted boolean, issue TEXT, last_modified_date timestamp, notification_method varchar(255), passcode varchar(255), pickup_time varchar(255), reference varchar(255), resolution varchar(255), status varchar(255), created_by uuid, finalised_by uuid, init_store_id uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
create table warranty_history (id uuid not null, created_date timestamp, description varchar(255), last_modified_date timestamp, employee_id uuid not null, store_id uuid not null, transaction_id uuid not null, primary key (id))
alter table if exists employee_stores add constraint UK_beripoopjvqmf3o7uu0n33hly unique (stores_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists transaction add constraint UK_ea0sj0oja3gyf9tj6v9n3ftjk unique (reference)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_stores add constraint FK30a4v5jchamkalulhsotfpvga foreign key (stores_id) references store
alter table if exists employee_stores add constraint FKo7cm2j8thu3u4p6bv7jwi4jnm foreign key (employee_id) references employee
alter table if exists move_path add constraint FKcfsnatmbgcktd3nbcda2mchv5 foreign key (store_id) references store
alter table if exists move_path add constraint FK5nglfbfoohp6tfdpa51gm82h5 foreign key (transaction_id) references transaction
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FKkwnf760xnl07l48nkelkaeip7 foreign key (init_store_id) references store
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists warranty_history add constraint FKhywddk1u6fgakdxpr0jiikyxx foreign key (employee_id) references employee
alter table if exists warranty_history add constraint FKj7af5lq0ptudgvsid4xa5d1o7 foreign key (store_id) references store
alter table if exists warranty_history add constraint FKd79psq2yqp7y0hmairff4h4of foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender varchar(255), is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role varchar(255), tfn varchar(255), username varchar(255), primary key (id))
create table employee_stores (employee_id uuid not null, stores_id uuid not null)
create table move_path (id uuid not null, created_date timestamp, last_modified_date timestamp, store_id uuid not null, transaction_id uuid not null, move_path_order int4, primary key (id))
create table store (id uuid not null, abn varchar(255), address varchar(255), company_name varchar(255), contact varchar(255), created_date timestamp, deleted_at timestamp, email varchar(255), is_deleted boolean, last_modified_date timestamp, name varchar(255), postcode varchar(255), reference int4, sequence serial, state varchar(255), suburb varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), auth_signature TEXT, battery varchar(255), color varchar(255), product_condition varchar(255), conf_signature TEXT, contact varchar(255), created_date timestamp, customer_name varchar(255), deposit varchar(255), device varchar(255), email varchar(255), finalised_time timestamp, imei varchar(255), is_deleted boolean, issue TEXT, last_modified_date timestamp, notification_method varchar(255), passcode varchar(255), pickup_time varchar(255), reference varchar(255), resolution varchar(255), status varchar(255), created_by uuid, finalised_by uuid, init_store_id uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
create table warranty_history (id uuid not null, created_date timestamp, description varchar(255), last_modified_date timestamp, employee_id uuid not null, store_id uuid not null, transaction_id uuid not null, primary key (id))
alter table if exists employee_stores add constraint UK_beripoopjvqmf3o7uu0n33hly unique (stores_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists transaction add constraint UK_ea0sj0oja3gyf9tj6v9n3ftjk unique (reference)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_stores add constraint FK30a4v5jchamkalulhsotfpvga foreign key (stores_id) references store
alter table if exists employee_stores add constraint FKo7cm2j8thu3u4p6bv7jwi4jnm foreign key (employee_id) references employee
alter table if exists move_path add constraint FKcfsnatmbgcktd3nbcda2mchv5 foreign key (store_id) references store
alter table if exists move_path add constraint FK5nglfbfoohp6tfdpa51gm82h5 foreign key (transaction_id) references transaction
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FKkwnf760xnl07l48nkelkaeip7 foreign key (init_store_id) references store
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists warranty_history add constraint FKhywddk1u6fgakdxpr0jiikyxx foreign key (employee_id) references employee
alter table if exists warranty_history add constraint FKj7af5lq0ptudgvsid4xa5d1o7 foreign key (store_id) references store
alter table if exists warranty_history add constraint FKd79psq2yqp7y0hmairff4h4of foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender varchar(255), is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role varchar(255), tfn varchar(255), username varchar(255), primary key (id))
create table employee_stores (employee_id uuid not null, stores_id uuid not null)
create table move_path (id uuid not null, created_date timestamp, last_modified_date timestamp, store_id uuid not null, transaction_id uuid not null, move_path_order int4, primary key (id))
create table store (id uuid not null, abn varchar(255), address varchar(255), company_name varchar(255), contact varchar(255), created_date timestamp, deleted_at timestamp, email varchar(255), is_deleted boolean, last_modified_date timestamp, name varchar(255), postcode varchar(255), reference int4, sequence serial, state varchar(255), suburb varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), auth_signature TEXT, battery varchar(255), color varchar(255), product_condition varchar(255), conf_signature TEXT, contact varchar(255), created_date timestamp, customer_name varchar(255), deposit varchar(255), device varchar(255), email varchar(255), finalised_time timestamp, imei varchar(255), is_deleted boolean, issue TEXT, last_modified_date timestamp, notification_method varchar(255), passcode varchar(255), pickup_time varchar(255), reference varchar(255), resolution varchar(255), status varchar(255), created_by uuid, finalised_by uuid, init_store_id uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
create table warranty_history (id uuid not null, created_date timestamp, description varchar(255), last_modified_date timestamp, employee_id uuid not null, store_id uuid not null, transaction_id uuid not null, primary key (id))
alter table if exists employee_stores add constraint UK_beripoopjvqmf3o7uu0n33hly unique (stores_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists transaction add constraint UK_ea0sj0oja3gyf9tj6v9n3ftjk unique (reference)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_stores add constraint FK30a4v5jchamkalulhsotfpvga foreign key (stores_id) references store
alter table if exists employee_stores add constraint FKo7cm2j8thu3u4p6bv7jwi4jnm foreign key (employee_id) references employee
alter table if exists move_path add constraint FKcfsnatmbgcktd3nbcda2mchv5 foreign key (store_id) references store
alter table if exists move_path add constraint FK5nglfbfoohp6tfdpa51gm82h5 foreign key (transaction_id) references transaction
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FKkwnf760xnl07l48nkelkaeip7 foreign key (init_store_id) references store
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists warranty_history add constraint FKhywddk1u6fgakdxpr0jiikyxx foreign key (employee_id) references employee
alter table if exists warranty_history add constraint FKj7af5lq0ptudgvsid4xa5d1o7 foreign key (store_id) references store
alter table if exists warranty_history add constraint FKd79psq2yqp7y0hmairff4h4of foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender varchar(255), is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role varchar(255), tfn varchar(255), username varchar(255), primary key (id))
create table employee_stores (employee_id uuid not null, stores_id uuid not null)
create table move_path (id uuid not null, created_date timestamp, last_modified_date timestamp, store_id uuid not null, transaction_id uuid not null, move_path_order int4, primary key (id))
create table store (id uuid not null, abn varchar(255), address varchar(255), company_name varchar(255), contact varchar(255), created_date timestamp, deleted_at timestamp, email varchar(255), is_deleted boolean, last_modified_date timestamp, name varchar(255), postcode varchar(255), reference int4, sequence serial, state varchar(255), suburb varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), auth_signature TEXT, battery varchar(255), color varchar(255), conf_signature TEXT, contact varchar(255), created_date timestamp, customer_name varchar(255), deposit varchar(255), device varchar(255), email varchar(255), finalised_time timestamp, imei varchar(255), is_deleted boolean, issue TEXT, last_modified_date timestamp, notification_method varchar(255), passcode varchar(255), reference varchar(255), resolution varchar(255), status varchar(255), created_by uuid, finalised_by uuid, init_store_id uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
create table warranty_history (id uuid not null, created_date timestamp, description varchar(255), last_modified_date timestamp, employee_id uuid not null, store_id uuid not null, transaction_id uuid not null, primary key (id))
alter table if exists employee_stores add constraint UK_beripoopjvqmf3o7uu0n33hly unique (stores_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists transaction add constraint UK_ea0sj0oja3gyf9tj6v9n3ftjk unique (reference)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_stores add constraint FK30a4v5jchamkalulhsotfpvga foreign key (stores_id) references store
alter table if exists employee_stores add constraint FKo7cm2j8thu3u4p6bv7jwi4jnm foreign key (employee_id) references employee
alter table if exists move_path add constraint FKcfsnatmbgcktd3nbcda2mchv5 foreign key (store_id) references store
alter table if exists move_path add constraint FK5nglfbfoohp6tfdpa51gm82h5 foreign key (transaction_id) references transaction
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FKkwnf760xnl07l48nkelkaeip7 foreign key (init_store_id) references store
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists warranty_history add constraint FKhywddk1u6fgakdxpr0jiikyxx foreign key (employee_id) references employee
alter table if exists warranty_history add constraint FKj7af5lq0ptudgvsid4xa5d1o7 foreign key (store_id) references store
alter table if exists warranty_history add constraint FKd79psq2yqp7y0hmairff4h4of foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender varchar(255), is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role varchar(255), tfn varchar(255), username varchar(255), primary key (id))
create table employee_stores (employee_id uuid not null, stores_id uuid not null)
create table move_path (id uuid not null, created_date timestamp, last_modified_date timestamp, store_id uuid not null, transaction_id uuid not null, move_path_order int4, primary key (id))
create table store (id uuid not null, abn varchar(255), address varchar(255), company_name varchar(255), contact varchar(255), created_date timestamp, deleted_at timestamp, email varchar(255), is_deleted boolean, last_modified_date timestamp, name varchar(255), postcode varchar(255), reference int4, sequence serial, state varchar(255), suburb varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), auth_signature TEXT, battery varchar(255), color varchar(255), conf_signature TEXT, contact varchar(255), created_date timestamp, customer_name varchar(255), deposit varchar(255), device varchar(255), email varchar(255), finalised_time timestamp, imei varchar(255), is_deleted boolean, issue TEXT, last_modified_date timestamp, notification_method varchar(255), passcode varchar(255), reference varchar(255), resolution varchar(255), status varchar(255), created_by uuid, finalised_by uuid, init_store_id uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
create table warranty_history (id uuid not null, created_date timestamp, description varchar(255), last_modified_date timestamp, employee_id uuid not null, store_id uuid not null, transaction_id uuid not null, primary key (id))
alter table if exists employee_stores add constraint UK_beripoopjvqmf3o7uu0n33hly unique (stores_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists transaction add constraint UK_ea0sj0oja3gyf9tj6v9n3ftjk unique (reference)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_stores add constraint FK30a4v5jchamkalulhsotfpvga foreign key (stores_id) references store
alter table if exists employee_stores add constraint FKo7cm2j8thu3u4p6bv7jwi4jnm foreign key (employee_id) references employee
alter table if exists move_path add constraint FKcfsnatmbgcktd3nbcda2mchv5 foreign key (store_id) references store
alter table if exists move_path add constraint FK5nglfbfoohp6tfdpa51gm82h5 foreign key (transaction_id) references transaction
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FKkwnf760xnl07l48nkelkaeip7 foreign key (init_store_id) references store
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists warranty_history add constraint FKhywddk1u6fgakdxpr0jiikyxx foreign key (employee_id) references employee
alter table if exists warranty_history add constraint FKj7af5lq0ptudgvsid4xa5d1o7 foreign key (store_id) references store
alter table if exists warranty_history add constraint FKd79psq2yqp7y0hmairff4h4of foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender varchar(255), is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role varchar(255), tfn varchar(255), username varchar(255), primary key (id))
create table employee_stores (employee_id uuid not null, stores_id uuid not null)
create table move_path (id uuid not null, created_date timestamp, last_modified_date timestamp, store_id uuid not null, transaction_id uuid not null, move_path_order int4, primary key (id))
create table store (id uuid not null, abn varchar(255), address varchar(255), company_name varchar(255), contact varchar(255), created_date timestamp, deleted_at timestamp, email varchar(255), is_deleted boolean, last_modified_date timestamp, name varchar(255), postcode varchar(255), reference int4, sequence serial, state varchar(255), suburb varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), auth_signature TEXT, battery varchar(255), color varchar(255), conf_signature TEXT, contact varchar(255), created_date timestamp, customer_name varchar(255), deposit varchar(255), device varchar(255), email varchar(255), finalised_time timestamp, imei varchar(255), is_deleted boolean, issue TEXT, last_modified_date timestamp, notification_method varchar(255), passcode varchar(255), reference varchar(255), resolution varchar(255), status varchar(255), created_by uuid, finalised_by uuid, init_store_id uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
create table warranty_history (id uuid not null, created_date timestamp, description varchar(255), last_modified_date timestamp, employee_id uuid not null, store_id uuid not null, transaction_id uuid not null, primary key (id))
alter table if exists employee_stores add constraint UK_beripoopjvqmf3o7uu0n33hly unique (stores_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists transaction add constraint UK_ea0sj0oja3gyf9tj6v9n3ftjk unique (reference)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_stores add constraint FK30a4v5jchamkalulhsotfpvga foreign key (stores_id) references store
alter table if exists employee_stores add constraint FKo7cm2j8thu3u4p6bv7jwi4jnm foreign key (employee_id) references employee
alter table if exists move_path add constraint FKcfsnatmbgcktd3nbcda2mchv5 foreign key (store_id) references store
alter table if exists move_path add constraint FK5nglfbfoohp6tfdpa51gm82h5 foreign key (transaction_id) references transaction
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FKkwnf760xnl07l48nkelkaeip7 foreign key (init_store_id) references store
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists warranty_history add constraint FKhywddk1u6fgakdxpr0jiikyxx foreign key (employee_id) references employee
alter table if exists warranty_history add constraint FKj7af5lq0ptudgvsid4xa5d1o7 foreign key (store_id) references store
alter table if exists warranty_history add constraint FKd79psq2yqp7y0hmairff4h4of foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender varchar(255), is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role varchar(255), tfn varchar(255), username varchar(255), primary key (id))
create table employee_stores (employee_id uuid not null, stores_id uuid not null)
create table move_path (id uuid not null, created_date timestamp, last_modified_date timestamp, store_id uuid not null, transaction_id uuid not null, move_path_order int4, primary key (id))
create table store (id uuid not null, abn varchar(255), address varchar(255), company_name varchar(255), contact varchar(255), created_date timestamp, deleted_at timestamp, email varchar(255), is_deleted boolean, last_modified_date timestamp, name varchar(255), postcode varchar(255), reference int4, sequence serial, state varchar(255), suburb varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), auth_signature TEXT, battery varchar(255), color varchar(255), conf_signature TEXT, contact varchar(255), created_date timestamp, customer_name varchar(255), deposit varchar(255), device varchar(255), email varchar(255), finalised_time timestamp, imei varchar(255), is_deleted boolean, issue TEXT, last_modified_date timestamp, notification_method varchar(255), passcode varchar(255), reference varchar(255), resolution varchar(255), status varchar(255), created_by uuid, finalised_by uuid, init_store_id uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
create table warranty_history (id uuid not null, created_date timestamp, description varchar(255), last_modified_date timestamp, employee_id uuid not null, store_id uuid not null, transaction_id uuid not null, primary key (id))
alter table if exists employee_stores add constraint UK_beripoopjvqmf3o7uu0n33hly unique (stores_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists transaction add constraint UK_ea0sj0oja3gyf9tj6v9n3ftjk unique (reference)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_stores add constraint FK30a4v5jchamkalulhsotfpvga foreign key (stores_id) references store
alter table if exists employee_stores add constraint FKo7cm2j8thu3u4p6bv7jwi4jnm foreign key (employee_id) references employee
alter table if exists move_path add constraint FKcfsnatmbgcktd3nbcda2mchv5 foreign key (store_id) references store
alter table if exists move_path add constraint FK5nglfbfoohp6tfdpa51gm82h5 foreign key (transaction_id) references transaction
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FKkwnf760xnl07l48nkelkaeip7 foreign key (init_store_id) references store
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists warranty_history add constraint FKhywddk1u6fgakdxpr0jiikyxx foreign key (employee_id) references employee
alter table if exists warranty_history add constraint FKj7af5lq0ptudgvsid4xa5d1o7 foreign key (store_id) references store
alter table if exists warranty_history add constraint FKd79psq2yqp7y0hmairff4h4of foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender varchar(255), is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role varchar(255), tfn varchar(255), username varchar(255), primary key (id))
create table employee_stores (employee_id uuid not null, stores_id uuid not null)
create table move_path (id uuid not null, created_date timestamp, last_modified_date timestamp, store_id uuid not null, transaction_id uuid not null, move_path_order int4, primary key (id))
create table store (id uuid not null, abn varchar(255), address varchar(255), company_name varchar(255), contact varchar(255), created_date timestamp, deleted_at timestamp, email varchar(255), is_deleted boolean, last_modified_date timestamp, name varchar(255), postcode varchar(255), reference int4, sequence serial, state varchar(255), suburb varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), auth_signature TEXT, battery varchar(255), color varchar(255), conf_signature TEXT, contact varchar(255), created_date timestamp, customer_name varchar(255), deposit varchar(255), device varchar(255), email varchar(255), finalised_time timestamp, imei varchar(255), is_deleted boolean, issue TEXT, last_modified_date timestamp, notification_method varchar(255), passcode varchar(255), reference varchar(255), resolution varchar(255), status varchar(255), created_by uuid, finalised_by uuid, init_store_id uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
create table warranty_history (id uuid not null, created_date timestamp, description varchar(255), last_modified_date timestamp, employee_id uuid not null, store_id uuid not null, transaction_id uuid not null, primary key (id))
alter table if exists employee_stores add constraint UK_beripoopjvqmf3o7uu0n33hly unique (stores_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists transaction add constraint UK_ea0sj0oja3gyf9tj6v9n3ftjk unique (reference)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_stores add constraint FK30a4v5jchamkalulhsotfpvga foreign key (stores_id) references store
alter table if exists employee_stores add constraint FKo7cm2j8thu3u4p6bv7jwi4jnm foreign key (employee_id) references employee
alter table if exists move_path add constraint FKcfsnatmbgcktd3nbcda2mchv5 foreign key (store_id) references store
alter table if exists move_path add constraint FK5nglfbfoohp6tfdpa51gm82h5 foreign key (transaction_id) references transaction
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FKkwnf760xnl07l48nkelkaeip7 foreign key (init_store_id) references store
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists warranty_history add constraint FKhywddk1u6fgakdxpr0jiikyxx foreign key (employee_id) references employee
alter table if exists warranty_history add constraint FKj7af5lq0ptudgvsid4xa5d1o7 foreign key (store_id) references store
alter table if exists warranty_history add constraint FKd79psq2yqp7y0hmairff4h4of foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender varchar(255), is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role varchar(255), tfn varchar(255), username varchar(255), primary key (id))
create table employee_stores (employee_id uuid not null, stores_id uuid not null)
create table move_path (id uuid not null, created_date timestamp, last_modified_date timestamp, store_id uuid not null, transaction_id uuid not null, move_path_order int4, primary key (id))
create table store (id uuid not null, abn varchar(255), address varchar(255), company_name varchar(255), contact varchar(255), created_date timestamp, deleted_at timestamp, email varchar(255), is_deleted boolean, last_modified_date timestamp, name varchar(255), postcode varchar(255), reference int4, sequence serial, state varchar(255), suburb varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), auth_signature TEXT, battery varchar(255), color varchar(255), conf_signature TEXT, contact varchar(255), created_date timestamp, customer_name varchar(255), deposit varchar(255), device varchar(255), email varchar(255), finalised_time timestamp, imei varchar(255), is_deleted boolean, issue TEXT, last_modified_date timestamp, notification_method varchar(255), passcode varchar(255), reference varchar(255), resolution varchar(255), status varchar(255), created_by uuid, finalised_by uuid, init_store_id uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
create table warranty_history (id uuid not null, created_date timestamp, description varchar(255), last_modified_date timestamp, employee_id uuid not null, store_id uuid not null, transaction_id uuid not null, primary key (id))
alter table if exists employee_stores add constraint UK_beripoopjvqmf3o7uu0n33hly unique (stores_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists transaction add constraint UK_ea0sj0oja3gyf9tj6v9n3ftjk unique (reference)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_stores add constraint FK30a4v5jchamkalulhsotfpvga foreign key (stores_id) references store
alter table if exists employee_stores add constraint FKo7cm2j8thu3u4p6bv7jwi4jnm foreign key (employee_id) references employee
alter table if exists move_path add constraint FKcfsnatmbgcktd3nbcda2mchv5 foreign key (store_id) references store
alter table if exists move_path add constraint FK5nglfbfoohp6tfdpa51gm82h5 foreign key (transaction_id) references transaction
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FKkwnf760xnl07l48nkelkaeip7 foreign key (init_store_id) references store
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists warranty_history add constraint FKhywddk1u6fgakdxpr0jiikyxx foreign key (employee_id) references employee
alter table if exists warranty_history add constraint FKj7af5lq0ptudgvsid4xa5d1o7 foreign key (store_id) references store
alter table if exists warranty_history add constraint FKd79psq2yqp7y0hmairff4h4of foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender varchar(255), is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role varchar(255), tfn varchar(255), username varchar(255), primary key (id))
create table employee_stores (employee_id uuid not null, stores_id uuid not null)
create table move_path (id uuid not null, created_date timestamp, last_modified_date timestamp, store_id uuid not null, transaction_id uuid not null, move_path_order int4, primary key (id))
create table store (id uuid not null, abn varchar(255), address varchar(255), company_name varchar(255), contact varchar(255), created_date timestamp, deleted_at timestamp, email varchar(255), is_deleted boolean, last_modified_date timestamp, name varchar(255), postcode varchar(255), reference int4, sequence serial, state varchar(255), suburb varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), auth_signature TEXT, battery varchar(255), color varchar(255), conf_signature TEXT, contact varchar(255), created_date timestamp, customer_name varchar(255), deposit varchar(255), device varchar(255), email varchar(255), finalised_time timestamp, imei varchar(255), is_deleted boolean, issue TEXT, last_modified_date timestamp, notification_method varchar(255), passcode varchar(255), reference varchar(255), resolution varchar(255), status varchar(255), created_by uuid, finalised_by uuid, init_store_id uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
create table warranty_history (id uuid not null, created_date timestamp, description varchar(255), last_modified_date timestamp, employee_id uuid not null, store_id uuid not null, transaction_id uuid not null, primary key (id))
alter table if exists employee_stores add constraint UK_beripoopjvqmf3o7uu0n33hly unique (stores_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists transaction add constraint UK_ea0sj0oja3gyf9tj6v9n3ftjk unique (reference)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_stores add constraint FK30a4v5jchamkalulhsotfpvga foreign key (stores_id) references store
alter table if exists employee_stores add constraint FKo7cm2j8thu3u4p6bv7jwi4jnm foreign key (employee_id) references employee
alter table if exists move_path add constraint FKcfsnatmbgcktd3nbcda2mchv5 foreign key (store_id) references store
alter table if exists move_path add constraint FK5nglfbfoohp6tfdpa51gm82h5 foreign key (transaction_id) references transaction
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FKkwnf760xnl07l48nkelkaeip7 foreign key (init_store_id) references store
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists warranty_history add constraint FKhywddk1u6fgakdxpr0jiikyxx foreign key (employee_id) references employee
alter table if exists warranty_history add constraint FKj7af5lq0ptudgvsid4xa5d1o7 foreign key (store_id) references store
alter table if exists warranty_history add constraint FKd79psq2yqp7y0hmairff4h4of foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender varchar(255), is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role varchar(255), tfn varchar(255), username varchar(255), primary key (id))
create table employee_stores (employee_id uuid not null, stores_id uuid not null)
create table move_path (id uuid not null, created_date timestamp, last_modified_date timestamp, store_id uuid not null, transaction_id uuid not null, move_path_order int4, primary key (id))
create table store (id uuid not null, abn varchar(255), address varchar(255), company_name varchar(255), contact varchar(255), created_date timestamp, deleted_at timestamp, email varchar(255), is_deleted boolean, last_modified_date timestamp, name varchar(255), postcode varchar(255), reference int4, sequence serial, state varchar(255), suburb varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), auth_signature TEXT, battery varchar(255), color varchar(255), conf_signature TEXT, contact varchar(255), created_date timestamp, customer_name varchar(255), deposit varchar(255), device varchar(255), email varchar(255), finalised_time timestamp, imei varchar(255), is_deleted boolean, issue TEXT, last_modified_date timestamp, notification_method varchar(255), passcode varchar(255), reference varchar(255), resolution varchar(255), status varchar(255), created_by uuid, finalised_by uuid, init_store_id uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
create table warranty_history (id uuid not null, created_date timestamp, description varchar(255), last_modified_date timestamp, employee_id uuid not null, store_id uuid not null, transaction_id uuid not null, primary key (id))
alter table if exists employee_stores add constraint UK_beripoopjvqmf3o7uu0n33hly unique (stores_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists transaction add constraint UK_ea0sj0oja3gyf9tj6v9n3ftjk unique (reference)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_stores add constraint FK30a4v5jchamkalulhsotfpvga foreign key (stores_id) references store
alter table if exists employee_stores add constraint FKo7cm2j8thu3u4p6bv7jwi4jnm foreign key (employee_id) references employee
alter table if exists move_path add constraint FKcfsnatmbgcktd3nbcda2mchv5 foreign key (store_id) references store
alter table if exists move_path add constraint FK5nglfbfoohp6tfdpa51gm82h5 foreign key (transaction_id) references transaction
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FKkwnf760xnl07l48nkelkaeip7 foreign key (init_store_id) references store
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists warranty_history add constraint FKhywddk1u6fgakdxpr0jiikyxx foreign key (employee_id) references employee
alter table if exists warranty_history add constraint FKj7af5lq0ptudgvsid4xa5d1o7 foreign key (store_id) references store
alter table if exists warranty_history add constraint FKd79psq2yqp7y0hmairff4h4of foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender varchar(255), is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role varchar(255), tfn varchar(255), username varchar(255), primary key (id))
create table employee_stores (employee_id uuid not null, stores_id uuid not null)
create table move_path (id uuid not null, created_date timestamp, last_modified_date timestamp, store_id uuid not null, transaction_id uuid not null, move_path_order int4, primary key (id))
create table store (id uuid not null, abn varchar(255), address varchar(255), company_name varchar(255), contact varchar(255), created_date timestamp, deleted_at timestamp, email varchar(255), is_deleted boolean, last_modified_date timestamp, name varchar(255), postcode varchar(255), reference int4, sequence serial, state varchar(255), suburb varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), auth_signature TEXT, battery varchar(255), color varchar(255), conf_signature TEXT, contact varchar(255), created_date timestamp, customer_name varchar(255), deposit varchar(255), device varchar(255), email varchar(255), finalised_time timestamp, imei varchar(255), is_deleted boolean, issue TEXT, last_modified_date timestamp, notification_method varchar(255), passcode varchar(255), reference varchar(255), resolution varchar(255), status varchar(255), created_by uuid, finalised_by uuid, init_store_id uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
create table warranty_history (id uuid not null, created_date timestamp, description varchar(255), last_modified_date timestamp, employee_id uuid not null, store_id uuid not null, transaction_id uuid not null, primary key (id))
alter table if exists employee_stores add constraint UK_beripoopjvqmf3o7uu0n33hly unique (stores_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists transaction add constraint UK_ea0sj0oja3gyf9tj6v9n3ftjk unique (reference)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_stores add constraint FK30a4v5jchamkalulhsotfpvga foreign key (stores_id) references store
alter table if exists employee_stores add constraint FKo7cm2j8thu3u4p6bv7jwi4jnm foreign key (employee_id) references employee
alter table if exists move_path add constraint FKcfsnatmbgcktd3nbcda2mchv5 foreign key (store_id) references store
alter table if exists move_path add constraint FK5nglfbfoohp6tfdpa51gm82h5 foreign key (transaction_id) references transaction
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FKkwnf760xnl07l48nkelkaeip7 foreign key (init_store_id) references store
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
alter table if exists warranty_history add constraint FKhywddk1u6fgakdxpr0jiikyxx foreign key (employee_id) references employee
alter table if exists warranty_history add constraint FKj7af5lq0ptudgvsid4xa5d1o7 foreign key (store_id) references store
alter table if exists warranty_history add constraint FKd79psq2yqp7y0hmairff4h4of foreign key (transaction_id) references transaction
