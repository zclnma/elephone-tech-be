alter table transaction
    alter column created_date type timestamp with time zone using created_date::TIMESTAMP;
alter table transaction_action
    alter column created_date type timestamp with time zone using created_date::TIMESTAMP;
alter table transaction_product
    alter column created_date type timestamp with time zone using created_date::TIMESTAMP;
alter table transaction_status
    alter column created_date type timestamp with time zone using created_date::TIMESTAMP;
alter table transaction_status_group
    alter column created_date type timestamp with time zone using created_date::TIMESTAMP;
alter table transaction_transition
    alter column created_date type timestamp with time zone using created_date::TIMESTAMP;
alter table warranty_history
    alter column created_date type timestamp with time zone using created_date::TIMESTAMP;
alter table comment
    alter column created_date type timestamp with time zone using created_date::TIMESTAMP;
alter table customer
    alter column created_date type timestamp with time zone using created_date::TIMESTAMP;
alter table device
    alter column created_date type timestamp with time zone using created_date::TIMESTAMP;
alter table employee
    alter column created_date type timestamp with time zone using created_date::TIMESTAMP;
alter table repair_type
    alter column created_date type timestamp with time zone using created_date::TIMESTAMP;
alter table store
    alter column created_date type timestamp with time zone using created_date::TIMESTAMP;
alter table transaction
    alter column last_modified_date type timestamp with time zone using last_modified_date::TIMESTAMP;
alter table transaction_action
    alter column last_modified_date type timestamp with time zone using last_modified_date::TIMESTAMP;
alter table transaction_product
    alter column last_modified_date type timestamp with time zone using last_modified_date::TIMESTAMP;
alter table transaction_status
    alter column last_modified_date type timestamp with time zone using last_modified_date::TIMESTAMP;
alter table transaction_status_group
    alter column last_modified_date type timestamp with time zone using last_modified_date::TIMESTAMP;
alter table transaction_transition
    alter column last_modified_date type timestamp with time zone using last_modified_date::TIMESTAMP;
alter table warranty_history
    alter column last_modified_date type timestamp with time zone using last_modified_date::TIMESTAMP;
alter table comment
    alter column last_modified_date type timestamp with time zone using last_modified_date::TIMESTAMP;
alter table employee
    alter column last_modified_date type timestamp with time zone using last_modified_date::TIMESTAMP;
alter table repair_type
    alter column last_modified_date type timestamp with time zone using last_modified_date::TIMESTAMP;
alter table store
    alter column last_modified_date type timestamp with time zone using last_modified_date::TIMESTAMP;
