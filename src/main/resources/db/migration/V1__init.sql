CREATE TYPE gender AS ENUM ('MALE','FEMALE');
CREATE TYPE emp_role AS ENUM ('USER','ADMIN');
CREATE TYPE notification_method AS ENUM ('MALE','FEMALE');
CREATE TYPE transaction_status AS ENUM ('WAIT','DONE','FINALISED');
CREATE TYPE inspection AS ENUM ('SENSOR','CAMERA','EAR_SPEAKER','LOUD_SPEAKER','WIFI','LCD','MICROPHONE','HOME','ID','VOLUME','CHARGING','LIQUID');

CREATE TABLE store
(
    id                 UUID NOT NULL PRIMARY KEY,
    abn                VARCHAR(255),
    address            VARCHAR(255),
    company_name       VARCHAR(255),
    contact            VARCHAR(255),
    created_date       TIMESTAMP,
    deleted_at         TIMESTAMP,
    email              VARCHAR(255),
    is_deleted         BOOLEAN,
    last_modified_date TIMESTAMP,
    name               VARCHAR(255) UNIQUE,
    postcode           VARCHAR(255),
    reference          INT4,
    sequence           SERIAL,
    state              VARCHAR(255),
    suburb             VARCHAR(255),
    warranty           INT4
);

CREATE TABLE employee
(
    id                 UUID         NOT NULL PRIMARY KEY,
    birthday           VARCHAR(255),
    cognito_id         UUID UNIQUE  NOT NULL,
    contact            VARCHAR(255),
    created_date       TIMESTAMP,
    email              VARCHAR(255),
    first_name         VARCHAR(255),
    gender             gender       NOT NULL,
    is_active          BOOLEAN,
    is_deleted         BOOLEAN,
    last_modified_date TIMESTAMP,
    last_name          VARCHAR(255),
    role               emp_role     NOT NULL,
    tfn                VARCHAR(255),
    username           VARCHAR(255) NOT NULL
);

CREATE TABLE transaction
(
    id                  UUID NOT NULL PRIMARY KEY,
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
    notification_method notification_method,
    reference           VARCHAR(255) UNIQUE,
    resolution          VARCHAR(255),
    status              transaction_status,
    created_by          UUID NOT NULL REFERENCES employee,
    finalised_by        UUID REFERENCES employee,
    init_store_id       UUID NOT NULL REFERENCES store,
    store_id            UUID NOT NULL REFERENCES store
);

CREATE TABLE comment
(
    id                 UUID NOT NULL PRIMARY KEY,
    content            VARCHAR(255),
    created_date       VARCHAR(255),
    last_modified_date TIMESTAMP,
    reason             VARCHAR(255),
    employee_id        UUID NOT NULL REFERENCES employee,
    transaction_id     UUID NOT NULL REFERENCES transaction
);

CREATE TABLE customer
(
    contact        VARCHAR(255),
    created_date   TIMESTAMP,
    email          VARCHAR(255),
    name           VARCHAR(255),
    transaction_id UUID NOT NULL REFERENCES transaction PRIMARY KEY
);

CREATE TABLE device
(
    transaction_id UUID NOT NULL REFERENCES transaction PRIMARY KEY,
    color          VARCHAR(255),
    created_date   TIMESTAMP,
    imei           VARCHAR(255),
    name           VARCHAR(255),
    passcode       VARCHAR(255)
);



CREATE TABLE employee_store
(
    employee_id UUID NOT NULL REFERENCES employee,
    store_id    UUID NOT NULL REFERENCES store,
    PRIMARY KEY (employee_id, store_id)
);

CREATE TABLE move_path
(
    id                 UUID NOT NULL PRIMARY KEY,
    created_date       TIMESTAMP,
    last_modified_date TIMESTAMP,
    store_id           UUID NOT NULL REFERENCES store,
    transaction_id     UUID NOT NULL REFERENCES transaction
);



CREATE TABLE transaction_final_inspections
(
    transaction_id    UUID NOT NULL REFERENCES transaction,
    final_inspections inspection
);

CREATE TABLE transaction_init_inspections
(
    transaction_id   UUID NOT NULL REFERENCES transaction,
    init_inspections inspection
);

CREATE TABLE transaction_product
(
    id                 UUID NOT NULL PRIMARY KEY,
    created_date       TIMESTAMP,
    description        VARCHAR(255),
    last_modified_date TIMESTAMP,
    number             VARCHAR(255),
    price              VARCHAR(255),
    transaction_id     UUID NOT NULL REFERENCES transaction
);

CREATE TABLE warranty_history
(
    id                 UUID NOT NULL PRIMARY KEY,
    created_date       TIMESTAMP,
    description        VARCHAR(255),
    last_modified_date TIMESTAMP,
    employee_id        UUID NOT NULL REFERENCES employee,
    store_id           UUID NOT NULL REFERENCES store,
    transaction_id     UUID NOT NULL REFERENCES transaction
);