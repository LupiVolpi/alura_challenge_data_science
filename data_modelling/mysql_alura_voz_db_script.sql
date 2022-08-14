CREATE DATABASE alura_voz;

CREATE TABLE SERVICE (
                service_id TINYINT NOT NULL,
                service_name VARCHAR(50) NOT NULL,
                service_value FLOAT NOT NULL,
                PRIMARY KEY (service_id)
);


CREATE TABLE CUSTOMER (
                customer_id VARCHAR(10) NOT NULL,
                address_1 VARCHAR(100) NOT NULL,
                address_2 VARCHAR(100),
                phone_1 INT NOT NULL,
                phone_2 INT,
                email VARCHAR(50) NOT NULL,
                PRIMARY KEY (customer_id)
);


CREATE TABLE ORGANISATION (
                customer_id VARCHAR(10) NOT NULL,
                cnpj VARCHAR(14) NOT NULL,
                PRIMARY KEY (customer_id)
);


CREATE TABLE INDIVIDUAL (
                customer_id VARCHAR(10) NOT NULL,
                cpf VARCHAR(11) NOT NULL,
                rg VARCHAR(9) NOT NULL,
                date_of_birth DATETIME NOT NULL,
                gender VARCHAR(20) NOT NULL,
                dependents BINARY(1) NOT NULL,
                partner BINARY(1) NOT NULL,
                PRIMARY KEY (customer_id)
);


CREATE TABLE CONTRACT (
                contract_id VARCHAR(10) NOT NULL,
                customer_id VARCHAR(10) NOT NULL,
                contract_status VARCHAR(10) NOT NULL,
                start_date DATETIME NOT NULL,
                end_date DATETIME,
                regimen VARCHAR(20) NOT NULL,
                payment_method VARCHAR(30) NOT NULL,
                paperless_billing BINARY(1) NOT NULL,
                contract_total_value FLOAT NOT NULL,
                PRIMARY KEY (contract_id)
);


CREATE TABLE CONTRACT_ITEM (
                contract_id VARCHAR(10) NOT NULL,
                service_id TINYINT NOT NULL,
                item_amount TINYINT NOT NULL,
                item_total_value FLOAT NOT NULL,
                PRIMARY KEY (contract_id, service_id)
);


ALTER TABLE CONTRACT_ITEM ADD CONSTRAINT service_contract_item_fk
FOREIGN KEY (service_id)
REFERENCES SERVICE (service_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE CONTRACT ADD CONSTRAINT customer_contract_fk
FOREIGN KEY (customer_id)
REFERENCES CUSTOMER (customer_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE INDIVIDUAL ADD CONSTRAINT customer_individual_fk
FOREIGN KEY (customer_id)
REFERENCES CUSTOMER (customer_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE ORGANISATION ADD CONSTRAINT customer_organisation_fk
FOREIGN KEY (customer_id)
REFERENCES CUSTOMER (customer_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE CONTRACT_ITEM ADD CONSTRAINT contract_contract_item_fk
FOREIGN KEY (contract_id)
REFERENCES CONTRACT (contract_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
