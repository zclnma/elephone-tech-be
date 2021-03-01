CREATE TYPE emp_role AS ENUM ('USER','ADMIN');
CREATE TYPE gender AS ENUM ('MALE','FEMALE','UNSPECIFIED');
CREATE TYPE transaction_status AS ENUM ('WAIT','DONE','FINALISED');

CREATE TABLE comment
(
    id                 UUID NOT NULL,
    content            VARCHAR(255),
    created_date       VARCHAR(255),
    last_modified_date TIMESTAMP,
    reason             VARCHAR(255),
    employee_id        UUID NOT NULL,
    transaction_id     UUID NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE customer
(
    contact        VARCHAR(255),
    created_date   TIMESTAMP,
    email          VARCHAR(255),
    name           VARCHAR(255),
    transaction_id UUID NOT NULL,
    PRIMARY KEY (transaction_id)
);

CREATE TABLE device
(
    color          VARCHAR(255),
    created_date   TIMESTAMP,
    imei           VARCHAR(255),
    name           VARCHAR(255),
    passcode       VARCHAR(255),
    transaction_id UUID NOT NULL,
    PRIMARY KEY (transaction_id)
);

CREATE TABLE employee
(
    id                 UUID NOT NULL,
    birthday           VARCHAR(255),
    cognito_id         UUID,
    contact            VARCHAR(255),
    created_date       TIMESTAMP,
    email              VARCHAR(255),
    first_name         VARCHAR(255),
    gender             gender,
    is_active          BOOLEAN,
    is_deleted         BOOLEAN,
    last_modified_date TIMESTAMP,
    last_name          VARCHAR(255),
    role               emp_role,
    tfn                VARCHAR(255),
    username           VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE employee_store
(
    employee_id UUID NOT NULL,
    store_id    UUID NOT NULL,
    PRIMARY KEY (employee_id, store_id)
);

CREATE TABLE move_path
(
    id                 UUID NOT NULL,
    created_date       TIMESTAMP,
    last_modified_date TIMESTAMP,
    store_id           UUID NOT NULL,
    transaction_id     UUID NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE store
(
    id                 UUID NOT NULL,
    abn                VARCHAR(255),
    address            VARCHAR(255),
    company_name       VARCHAR(255),
    contact            VARCHAR(255),
    created_date       TIMESTAMP,
    deleted_at         TIMESTAMP,
    email              VARCHAR(255),
    is_deleted         BOOLEAN,
    last_modified_date TIMESTAMP,
    name               VARCHAR(255),
    postcode           VARCHAR(255),
    reference          INT4,
    sequence           SERIAL,
    state              VARCHAR(255),
    suburb             VARCHAR(255),
    warranty           INT4,
    PRIMARY KEY (id)
);

CREATE TABLE transaction
(
    id                  UUID NOT NULL,
    addition_info       VARCHAR(255),
    auth_signature      TEXT,
    battery             VARCHAR(255),
    conf_signature      TEXT,
    created_date        TIMESTAMP,
    deposit             VARCHAR(255),
    finalised_time      TIMESTAMP,
    is_deleted          BOOLEAN,
    issue               TEXT,
    last_modified_date  TIMESTAMP,
    notification_method VARCHAR(255),
    reference           VARCHAR(255),
    resolution          VARCHAR(255),
    status              transaction_status,
    created_by          UUID NOT NULL,
    finalised_by        UUID,
    init_store_id       UUID NOT NULL,
    store_id            UUID NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE transaction_final_inspections
(
    transaction_id    UUID NOT NULL,
    final_inspections VARCHAR(255)
);

CREATE TABLE transaction_init_inspections
(
    transaction_id   UUID NOT NULL,
    init_inspections VARCHAR(255)
);

CREATE TABLE transaction_product
(
    id                 UUID NOT NULL,
    created_date       TIMESTAMP,
    description        VARCHAR(255),
    last_modified_date TIMESTAMP,
    number             VARCHAR(255),
    price              VARCHAR(255),
    transaction_id     UUID NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE warranty_history
(
    id                 UUID NOT NULL,
    created_date       TIMESTAMP,
    description        VARCHAR(255),
    last_modified_date TIMESTAMP,
    employee_id        UUID NOT NULL,
    store_id           UUID NOT NULL,
    transaction_id     UUID NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS store
    add constraint UK_d0p5ly1cv6guij7sq1mbnr8ec unique (name);
ALTER TABLE IF EXISTS transaction
    add constraint UK_ea0sj0oja3gyf9tj6v9n3ftjk unique (reference);
ALTER TABLE IF EXISTS comment
    add constraint FKcdf32ke5u3365kjpxgjejuhsg FOREIGN KEY (employee_id) references employee;
ALTER TABLE IF EXISTS comment
    add constraint FK8aaato35pg2pna5wv65ou1go FOREIGN KEY (transaction_id) references transaction;
ALTER TABLE IF EXISTS customer
    add constraint FKqc3nhha51027sp3mf9uooohse FOREIGN KEY (transaction_id) references transaction;
ALTER TABLE IF EXISTS device
    add constraint FK8edy3f9otlgfln4tiptatd35j FOREIGN KEY (transaction_id) references transaction;
ALTER TABLE IF EXISTS employee_store
    add constraint FKsviyscw7hc9afsjroyur5dwxu FOREIGN KEY (store_id) references store;
ALTER TABLE IF EXISTS employee_store
    add constraint FK30fc25ej0rcdgdfrm1chfo6kj FOREIGN KEY (employee_id) references employee;
ALTER TABLE IF EXISTS move_path
    add constraint FKcfsnatmbgcktd3nbcda2mchv5 FOREIGN KEY (store_id) references store;
ALTER TABLE IF EXISTS move_path
    add constraint FK5nglfbfoohp6tfdpa51gm82h5 FOREIGN KEY (transaction_id) references transaction;
ALTER TABLE IF EXISTS transaction
    add constraint FKrpx9b019itm9mwitcw53ui0tb FOREIGN KEY (created_by) references employee;
ALTER TABLE IF EXISTS transaction
    add constraint FKcckopmu8rb9im7f2a20jkeloh FOREIGN KEY (finalised_by) references employee;
ALTER TABLE IF EXISTS transaction
    add constraint FKkwnf760xnl07l48nkelkaeip7 FOREIGN KEY (init_store_id) references store;
ALTER TABLE IF EXISTS transaction
    add constraint FK1eprpvnt4sd424pavi0mc91a5 FOREIGN KEY (store_id) references store;
ALTER TABLE IF EXISTS transaction_final_inspections
    add constraint FK6t7utxn131mawl8td7eebpm4i FOREIGN KEY (transaction_id) references transaction;
ALTER TABLE IF EXISTS transaction_init_inspections
    add constraint FKb6dma4rcg7j7e5ch7kbisr028 FOREIGN KEY (transaction_id) references transaction;
ALTER TABLE IF EXISTS transaction_product
    add constraint FKg4pbq1m3u41i2cbobs8dffe31 FOREIGN KEY (transaction_id) references transaction;
ALTER TABLE IF EXISTS warranty_history
    add constraint FKhywddk1u6fgakdxpr0jiikyxx FOREIGN KEY (employee_id) references employee;
ALTER TABLE IF EXISTS warranty_history
    add constraint FKj7af5lq0ptudgvsid4xa5d1o7 FOREIGN KEY (store_id) references store;
ALTER TABLE IF EXISTS warranty_history
    add constraint FKd79psq2yqp7y0hmairff4h4of FOREIGN KEY (transaction_id) references transaction;