create table comment
(
    id                 uuid not null,
    content            varchar(255),
    created_date       varchar(255),
    last_modified_date timestamp,
    employee_id        uuid not null,
    transaction_id     uuid not null,
    primary key (id)
);
create table employee
(
    id                 uuid not null,
    birthday           varchar(255),
    contact            varchar(255),
    created_date       timestamp,
    email              varchar(255),
    first_name         varchar(255),
    gender             int4,
    last_modified_date timestamp,
    last_name          varchar(255),
    tfn                varchar(255),
    primary key (id)
);
create table employee_store
(
    employee_id uuid not null,
    store_id    uuid not null,
    primary key (employee_id, store_id)
);
create table income
(
    id                 uuid not null,
    cash               int4,
    created_date       timestamp,
    efpos              int4,
    last_modified_date timestamp,
    employee_id        uuid,
    store_id           uuid not null,
    primary key (id)
);
create table product
(
    id                 uuid not null,
    brand              varchar(255),
    category           varchar(255),
    created_date       timestamp,
    description        varchar(255),
    last_modified_date timestamp,
    name               varchar(255),
    price              float4,
    series             varchar(255),
    primary key (id)
);
create table store
(
    id                 uuid not null,
    abn                varchar(255),
    cognito_id         uuid,
    contact            varchar(255),
    created_date       timestamp,
    last_modified_date timestamp,
    name               varchar(255),
    role               int4,
    sequence           varchar(255),
    lat_end            float4,
    lat_start          float4,
    lng_end            float4,
    lng_start          float4,
    warranty           int4,
    primary key (id)
);
create table transaction
(
    id                 uuid not null,
    color              varchar(255),
    product_condition  varchar(255),
    contact            varchar(255),
    created_date       timestamp,
    customer_name      varchar(255),
    device             varchar(255),
    finalised_time     varchar(255),
    imei               varchar(255),
    inspection         boolean default false,
    is_finalised       boolean default false,
    issue              text,
    last_modified_date timestamp,
    pickup_time        varchar(255),
    resolution         varchar(255),
    status             int4,
    transaction_number varchar(255),
    created_by         uuid,
    finalised_by       uuid,
    store_id           uuid,
    primary key (id)
);
create table transaction_products
(
    transaction_id uuid not null,
    description    varchar(255),
    number         varchar(255),
    price          varchar(255),
    product_id     uuid
);
create table work_history
(
    id                 uuid not null,
    created_date       timestamp,
    finish             varchar(255),
    last_modified_date timestamp,
    start              varchar(255),
    employee_id        uuid not null,
    primary key (id)
);
alter table if exists store
    add constraint UK_muglfrr8q4e0uuqr36xk4mohw unique (cognito_id);
alter table if exists store
    add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name);
alter table if exists store
    add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence);
alter table if exists transaction
    add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number);
alter table if exists comment
    add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee;
alter table if exists comment
    add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction;
alter table if exists employee_store
    add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store;
alter table if exists employee_store
    add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee;
alter table if exists income
    add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee;
alter table if exists income
    add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store;
alter table if exists transaction
    add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee;
alter table if exists transaction
    add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee;
alter table if exists transaction
    add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store;
alter table if exists transaction_products
    add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product;
alter table if exists transaction_products
    add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction;
alter table if exists work_history
    add constraint FK15x6d9ck2h75t4xhx0dabqkn foreign key (employee_id) references employee;
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists store add constraint UK_muglfrr8q4e0uuqr36xk4mohw unique (cognito_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists store add constraint UK_muglfrr8q4e0uuqr36xk4mohw unique (cognito_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists store add constraint UK_muglfrr8q4e0uuqr36xk4mohw unique (cognito_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists store add constraint UK_muglfrr8q4e0uuqr36xk4mohw unique (cognito_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists store add constraint UK_muglfrr8q4e0uuqr36xk4mohw unique (cognito_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists store add constraint UK_muglfrr8q4e0uuqr36xk4mohw unique (cognito_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists store add constraint UK_muglfrr8q4e0uuqr36xk4mohw unique (cognito_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists store add constraint UK_muglfrr8q4e0uuqr36xk4mohw unique (cognito_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists store add constraint UK_muglfrr8q4e0uuqr36xk4mohw unique (cognito_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists store add constraint UK_muglfrr8q4e0uuqr36xk4mohw unique (cognito_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists store add constraint UK_muglfrr8q4e0uuqr36xk4mohw unique (cognito_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists store add constraint UK_muglfrr8q4e0uuqr36xk4mohw unique (cognito_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists store add constraint UK_muglfrr8q4e0uuqr36xk4mohw unique (cognito_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists store add constraint UK_muglfrr8q4e0uuqr36xk4mohw unique (cognito_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists store add constraint UK_muglfrr8q4e0uuqr36xk4mohw unique (cognito_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists store add constraint UK_muglfrr8q4e0uuqr36xk4mohw unique (cognito_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists store add constraint UK_muglfrr8q4e0uuqr36xk4mohw unique (cognito_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists store add constraint UK_muglfrr8q4e0uuqr36xk4mohw unique (cognito_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists employee add constraint UK_i5tukq21oiley478t5ji9rpsh unique (cognito_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists employee add constraint UK_i5tukq21oiley478t5ji9rpsh unique (cognito_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists employee add constraint UK_i5tukq21oiley478t5ji9rpsh unique (cognito_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists employee add constraint UK_i5tukq21oiley478t5ji9rpsh unique (cognito_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists employee add constraint UK_i5tukq21oiley478t5ji9rpsh unique (cognito_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists employee add constraint UK_i5tukq21oiley478t5ji9rpsh unique (cognito_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists employee add constraint UK_i5tukq21oiley478t5ji9rpsh unique (cognito_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists employee add constraint UK_i5tukq21oiley478t5ji9rpsh unique (cognito_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists employee add constraint UK_i5tukq21oiley478t5ji9rpsh unique (cognito_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists employee add constraint UK_i5tukq21oiley478t5ji9rpsh unique (cognito_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists employee add constraint UK_i5tukq21oiley478t5ji9rpsh unique (cognito_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists employee add constraint UK_i5tukq21oiley478t5ji9rpsh unique (cognito_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists employee add constraint UK_i5tukq21oiley478t5ji9rpsh unique (cognito_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists employee add constraint UK_i5tukq21oiley478t5ji9rpsh unique (cognito_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists employee add constraint UK_i5tukq21oiley478t5ji9rpsh unique (cognito_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists employee add constraint UK_i5tukq21oiley478t5ji9rpsh unique (cognito_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists employee add constraint UK_i5tukq21oiley478t5ji9rpsh unique (cognito_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists employee add constraint UK_i5tukq21oiley478t5ji9rpsh unique (cognito_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), role int4, sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists employee add constraint UK_i5tukq21oiley478t5ji9rpsh unique (cognito_id)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table product (id uuid not null, brand varchar(255), category varchar(255), created_date timestamp, description varchar(255), last_modified_date timestamp, name varchar(255), price float4, series varchar(255), primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), inspection boolean default false, is_finalised boolean default false, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255), product_id uuid)
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_products add constraint FKcdflw5qw2w7346buxb5kb9rck foreign key (product_id) references product
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean default false, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean default false, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), lat_end float4, lat_start float4, lng_end float4, lng_start float4, warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean default false, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean default false, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean default false, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean default false, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean default false, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean default false, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean default false, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean default false, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean default false, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean default false, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean default false, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean default false, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean default false, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean default false, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean default false, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean default false, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean default false, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean default false, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean default false, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean default false, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean default false, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null, primary key (employee_id, store_id))
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean default false, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean default false, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean default false, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean default false, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean default false, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean default false, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean default false, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean default false, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean default false, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean default false, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean default false, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean default false, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_deleted boolean, is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_deleted boolean, is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_deleted boolean, is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_deleted boolean, is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_deleted boolean, is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_deleted boolean, is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_deleted boolean, is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_deleted boolean, is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections varchar(255))
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), username varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_deleted boolean, is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections int4)
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), username varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_deleted boolean, is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections int4)
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), username varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_deleted boolean, is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections int4)
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), username varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_deleted boolean, is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections int4)
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), username varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_deleted boolean, is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections int4)
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), username varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_deleted boolean, is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections int4)
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), username varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_deleted boolean, is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections int4)
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), username varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_deleted boolean, is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections int4)
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), username varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_deleted boolean, is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections int4)
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), username varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_deleted boolean, is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections int4)
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), username varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_deleted boolean, is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections int4)
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), username varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_deleted boolean, is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections int4)
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), username varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_deleted boolean, is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections int4)
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), username varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_deleted boolean, is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections int4)
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), username varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_deleted boolean, is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections int4)
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), username varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_deleted boolean, is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections int4)
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), username varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_deleted boolean, is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections int4)
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), username varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_deleted boolean, is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature varchar(255), status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections int4)
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), username varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), battery varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_deleted boolean, is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature TEXT, status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections int4)
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), username varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), battery varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_deleted boolean, is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature TEXT, status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections int4)
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), username varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), battery varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_deleted boolean, is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature TEXT, status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections int4)
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), username varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), battery varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_deleted boolean, is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature TEXT, status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections int4)
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), username varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), battery varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_deleted boolean, is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature TEXT, status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections int4)
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), username varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), battery varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_deleted boolean, is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature TEXT, status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections int4)
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), username varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), battery varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_deleted boolean, is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature TEXT, status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections int4)
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), username varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), battery varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_deleted boolean, is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature TEXT, status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections int4)
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), username varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), battery varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_deleted boolean, is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature TEXT, status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections int4)
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), username varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), battery varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_deleted boolean, is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature TEXT, status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections int4)
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), username varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), battery varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_deleted boolean, is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature TEXT, status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections int4)
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), username varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), contact varchar(255), created_date timestamp, is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), battery varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_deleted boolean, is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature TEXT, status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections int4)
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
create table comment (id uuid not null, content varchar(255), created_date varchar(255), last_modified_date timestamp, reason varchar(255), employee_id uuid not null, transaction_id uuid not null, primary key (id))
create table employee (id uuid not null, birthday varchar(255), cognito_id uuid, contact varchar(255), created_date timestamp, email varchar(255), first_name varchar(255), gender int4, is_active boolean, is_deleted boolean, last_modified_date timestamp, last_name varchar(255), role int4, tfn varchar(255), username varchar(255), primary key (id))
create table employee_store (employee_id uuid not null, store_id uuid not null)
create table income (id uuid not null, cash int4, created_date timestamp, efpos int4, last_modified_date timestamp, employee_id uuid, store_id uuid not null, primary key (id))
create table store (id uuid not null, abn varchar(255), address varchar(255), contact varchar(255), created_date timestamp, email varchar(255), is_deleted boolean, last_modified_date timestamp, name varchar(255), sequence varchar(255), warranty int4, primary key (id))
create table transaction (id uuid not null, addition_info varchar(255), battery varchar(255), color varchar(255), product_condition varchar(255), contact varchar(255), created_date timestamp, customer_name varchar(255), device varchar(255), done_time timestamp, email varchar(255), finalised_time varchar(255), imei varchar(255), is_deleted boolean, is_finalised boolean, issue text, last_modified_date timestamp, passcode varchar(255), pickup_time varchar(255), resolution varchar(255), send_time timestamp, signature TEXT, status int4, transaction_number varchar(255), created_by uuid, finalised_by uuid, store_id uuid, primary key (id))
create table transaction_inspections (transaction_id uuid not null, inspections int4)
create table transaction_products (transaction_id uuid not null, description varchar(255), number varchar(255), price varchar(255))
alter table if exists store add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name)
alter table if exists store add constraint UK_gy2t1kmdqvne04o8xxb9c7chc unique (sequence)
alter table if exists transaction add constraint UK_44jtkuk58kmk5m7hobrk9v7ho unique (transaction_number)
alter table if exists comment add constraint FKcdf32ke5u3365kjpxgjejuhsg foreign key (employee_id) references employee
alter table if exists comment add constraint FK8aaato35pg2pna5wv65ou1go foreign key (transaction_id) references transaction
alter table if exists employee_store add constraint FKsviyscw7hc9afsjroyur5dwxu foreign key (store_id) references store
alter table if exists employee_store add constraint FK30fc25ej0rcdgdfrm1chfo6kj foreign key (employee_id) references employee
alter table if exists income add constraint FKevjfnwv5rp70ajrfda6417iyc foreign key (employee_id) references employee
alter table if exists income add constraint FKjhgvs0kbdkc7u23cjijeb86fp foreign key (store_id) references store
alter table if exists transaction add constraint FKrpx9b019itm9mwitcw53ui0tb foreign key (created_by) references employee
alter table if exists transaction add constraint FKcckopmu8rb9im7f2a20jkeloh foreign key (finalised_by) references employee
alter table if exists transaction add constraint FK1eprpvnt4sd424pavi0mc91a5 foreign key (store_id) references store
alter table if exists transaction_inspections add constraint FK8fklrobuciaofdrf3xk3kf7cm foreign key (transaction_id) references transaction
alter table if exists transaction_products add constraint FK3x18hiv3x9rw1tfhxq8d7pnuu foreign key (transaction_id) references transaction
