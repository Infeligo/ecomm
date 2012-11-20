DROP SEQUENCE s_cst_type;

CREATE SEQUENCE s_cst_type
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE s_cst_type OWNER TO ourdeveloper;
GRANT ALL ON TABLE s_cst_type TO mihhail_admin;
GRANT ALL ON TABLE s_cst_type TO ourdeveloper;

------------------------------------------------ 
DELETE FROM cst_type;

INSERT INTO cst_type( cst_type, "name")
     VALUES (nextval('s_cst_type'), 'Business customer'),
            (nextval('s_cst_type'), 'Private customer');

-------------------------------------------------
DELETE FROM cst_state_type;

SELECT setval('s_cst_state_type', 1);

INSERT INTO cst_state_type( cst_state_type, "name")
     VALUES (currval('s_cst_state_type'), 'Gold customer'),
            (nextval('s_cst_state_type'), 'Ordinary customer');
            
---------------------------------------------------------------            
DELETE FROM EMP_ROLE;

INSERT INTO emp_role(emp_role, "name")
     VALUES (1, 'Consultant');

----------------------------------------------------------
DELETE FROM struct_unit;

INSERT INTO struct_unit( struct_unit, struct_unit_type, unit_code, "name", description, upper_unit, name_in_en)
    VALUES (nextval('s_struct_unit'), 1, 'Tallinn-01', 'Head office', 'Head office in Tallinn', null, 'Head office');
    
------------------------------------------------------------
DELETE FROM employee;

INSERT INTO employee(
            employee, first_name, last_name, emp_code, created_by, updated_by, 
            current_position, current_manager, current_struct_unit, created, 
            updated, emp_role)
    VALUES (nextval('s_employee'), 'Martin', 'Talviste', 'TALL01-Talviste', 1, null, 
            1, 1, 1, now(), 
            now(), 1);

INSERT INTO employee(
            employee, first_name, last_name, emp_code, created_by, updated_by, 
            current_position, current_manager, current_struct_unit, created, 
            updated, emp_role)
    VALUES (nextval('s_employee'), 'Eve', 'Kops', 'TALL01-Kops', 1, null, 
            1, 1, 1, now(), 
            now(), 1);

------------------------------------------------------------------
DELETE FROM customer;

INSERT INTO customer(
            customer, first_name, last_name, identity_code, note, created, 
            updated, created_by, updated_by, birth_date, cst_type, cst_state_type)
    VALUES (nextval('customer_id'), 'Maarika', 'Tamm', NULL, 'Blond', now(), 
            null, 1, null, null, 2, 2),
            (nextval('customer_id'), 'Anne', 'Sali', NULL, NULL, now(), 
            null, 1, null, null, 2, 2),
            (nextval('customer_id'), 'Juhan', 'Tartu', NULL, 'Tartu Software AS juhatuse liige', now(), 
            null, 1, null, null, 1, 1),
            (nextval('customer_id'), 'Elisabeth', 'Smith', NULL, NULL, now(), 
            null, 1, null, null, 2, 1);

------------------------------------------------------------------
DELETE FROM contract_type;

INSERT INTO contract_type(contract_type, "name")
    VALUES (nextval('s_contract_type'), 'Credit contract');
    
--------------------------------------------------
DELETE FROM contract_status_type;

INSERT INTO contract_status_type(contract_status_type, "name")
    VALUES (nextval('s_contract_status_type'), 'Submitted'),
	   (nextval('s_contract_status_type'), 'Accepted'),
	   (nextval('s_contract_status_type'), 'Rejected');

---------------------------------------------------
DELETE FROM CONTRACT;

INSERT INTO contract(
            contract, contract_manager, contract_status_type, customer, contract_type, 
            cnt_number, "name", description, valid_from, valid_to, parent_cnt, 
            created, updated, created_by, updated_by, conditions, note, value_amount, 
            struct_unit)
    VALUES (nextval('s_contract'), NULL, 1, 1, 1, 
            'TALL01-00120121011', 'Credit Contract', 'Credit period 1 year, amount 1000eur', now(), now() + interval '1 year', NULL, 
            now(), NULL, 1, NULL, 'Rate of interest is 5%', 'Amount is in EUR', 1000, 
            1);

INSERT INTO contract(
            contract, contract_manager, contract_status_type, customer, contract_type, 
            cnt_number, "name", description, valid_from, valid_to, parent_cnt, 
            created, updated, created_by, updated_by, conditions, note, value_amount, 
            struct_unit)
    VALUES (nextval('s_contract'), NULL, 1, 3, 1, 
            'TALL01-00220121011', 'Credit Contract', 'Credit period 5 year, amount 150000eur', now(), now() + interval '5 year', NULL, 
            now(), NULL, 1, NULL, 'Rate of interest is 3,5%, recurring payment on every 7th day of the month', 'Amount is in EUR', 150000, 
            1);
-------------------------------------------------------------            
DELETE FROM contract_status;

INSERT INTO contract_status(
            contract_status, contract, contract_status_type, valid_from, 
            valid_to, status, created, created_by, ended, ended_by)
    VALUES (nextval('s_contract_status'), 1, 1, now(), 
            NULL, NULL, now(), 1, NULL, NULL),
            (nextval('s_contract_status'), 2, 1, now(), 
            NULL, NULL, now(), 1, NULL, NULL);            