
CREATE SEQUENCE  customer_id  START 1;

CREATE TABLE customer (
       customer            NUMERIC(30,0)  CONSTRAINT customer_pk PRIMARY KEY DEFAULT NEXTVAL('customer_id'),
       first_name          VARCHAR(100),
       last_name           VARCHAR(100),
       identity_code       VARCHAR(20),
       note                VARCHAR(1000),
       created             TIMESTAMP,
       updated             TIMESTAMP,
       created_by          NUMERIC(30,0),
       updated_by          NUMERIC(30,0),
       birth_date          TIMESTAMP,
       cst_type            NUMERIC(2,0),
       cst_state_type      NUMERIC(2,0)   
);



CREATE SEQUENCE  s_contract  START 1;

CREATE TABLE contract (
       contract               NUMERIC(30,0) CONSTRAINT contract_pk PRIMARY KEY DEFAULT NEXTVAL('s_contract'),
       contract_manager       NUMERIC(30,0),
       contract_status_type   NUMERIC(30,0),
       customer               NUMERIC(30,0),
       contract_type          NUMERIC(30,0),
       cnt_number             VARCHAR(20),
       name                   VARCHAR(200),
       description            VARCHAR(300),
       valid_from             TIMESTAMP,
       valid_to               TIMESTAMP,
       parent_cnt             NUMERIC(30,0),
       created                TIMESTAMP,
       updated                TIMESTAMP,
       created_by             NUMERIC(30,0),
       updated_by             NUMERIC(30,0),
       conditions             VARCHAR(300),
       note                   VARCHAR(300),
       value_amount           NUMERIC(32,16),
       struct_unit            NUMERIC(30,0)
);


CREATE SEQUENCE  s_cst_address  START 1;

CREATE TABLE cst_address (
    cst_address                  NUMERIC(30,0) CONSTRAINT cst_address_pk PRIMARY KEY DEFAULT NEXTVAL('s_cst_address'),
    customer                       NUMERIC(30,0),
    zip                            VARCHAR(20),
    house                          VARCHAR(100),
    address                        VARCHAR(100),
    county                         VARCHAR(100),
    parish                         VARCHAR(100),
    town_county                    VARCHAR(100),
    address_type                   NUMERIC(30,0),
    phone                          VARCHAR(20),
    sms                            VARCHAR(20),
    mobile                         VARCHAR(20),
    email                          VARCHAR(30),
    note                           VARCHAR(50),
    country                        NUMERIC(30,0),
    created                        TIMESTAMP,
    updated                        TIMESTAMP,
    created_by                     NUMERIC(30,0),
    updated_by                     NUMERIC(30,0)
 );

CREATE SEQUENCE  s_cst_user  START 1;

CREATE TABLE cst_user (
    cst_user                       NUMERIC(30,0) CONSTRAINT cst_user_pk PRIMARY KEY DEFAULT NEXTVAL('s_cst_user'),
    customer                       NUMERIC(30,0),
    username                       VARCHAR(20),
    passw                          VARCHAR(300),
    user_status_type               NUMERIC(30,0),
    user_status_date               TIMESTAMP,
    created                        TIMESTAMP,
    updated                        TIMESTAMP,
    created_by                     NUMERIC(30,0),
    updated_by                     NUMERIC(30,0),
    last_session                   NUMERIC(30,0),
    contact_email                  VARCHAR(30)
 );



CREATE SEQUENCE  s_product_catalog  START 1;

CREATE TABLE product_catalog (
    product_catalog                NUMERIC(30,0) CONSTRAINT product_catalog_pk PRIMARY KEY DEFAULT NEXTVAL('s_product_catalog'),
    upper_catalog                  NUMERIC(30,0),
    cat_level                      NUMERIC(30,0),
    customer                       NUMERIC(30,0),
    catalog_type                   NUMERIC(30,0),
    name                           VARCHAR(100),
    description                    VARCHAR(500),
    item_count                     NUMERIC(30,0),
    last_item_updated              TIMESTAMP,
    last_item_created              TIMESTAMP,
    created_by                     NUMERIC(30,0),
    updated_by                     NUMERIC(30,0),
    created                        TIMESTAMP,
    updated                        TIMESTAMP,
    status_type                    NUMERIC(30,0),
    catalog_code                   VARCHAR(20),
    struct_unit                    NUMERIC(30,0)
 );


CREATE SEQUENCE  s_product  START 1;

CREATE TABLE product (
    product                        NUMERIC(30,0) CONSTRAINT product_pk PRIMARY KEY DEFAULT NEXTVAL('s_product'),
    enterprise                     NUMERIC(30,0),
    product_type                   NUMERIC(30,0),
    created_by                     NUMERIC(30,0),
    catalog                        NUMERIC(30,0),
    code                           VARCHAR(20),
    code1                          VARCHAR(20),
    name                           VARCHAR(100),
    description                    VARCHAR(300),
    created                        TIMESTAMP,
    updated                        TIMESTAMP,
    updated_by                     NUMERIC(30,0),
    price                          NUMERIC(30,6),
    price2                         NUMERIC(30,6),
    price3                         NUMERIC(30,6),
    product_status_type            NUMERIC(30,0),
    producer                       VARCHAR(200)
 );


CREATE SEQUENCE  s_struct_unit  START 1;

CREATE TABLE struct_unit (
    struct_unit                    NUMERIC(30,0) CONSTRAINT struct_unit_pk PRIMARY KEY DEFAULT NEXTVAL('s_struct_unit'),
    struct_unit_type               NUMERIC(30,0) NOT NULL,
    unit_code                      VARCHAR(20),
    name                           VARCHAR(300),
    description                    VARCHAR(1000),
    upper_unit                     NUMERIC(30,0),
    name_in_en                     VARCHAR(300)
 );


CREATE SEQUENCE  s_product_product_catalog  START 1;

CREATE TABLE product_product_catalog (
    product_product_catalog        NUMERIC(30,0) CONSTRAINT product_product_catalog_pk PRIMARY KEY DEFAULT NEXTVAL('s_product_product_catalog'),
    product_catalog                NUMERIC(30,0),
    product                        NUMERIC(30,0),
    note                           VARCHAR(100),
    relation_type                  NUMERIC(30,0),
    created                        TIMESTAMP,
    created_by                     NUMERIC(30,0),
    deleted                        TIMESTAMP,
    deleted_by                     NUMERIC(30,0)
 );


CREATE SEQUENCE  s_employee  START 1;

CREATE TABLE employee (
    employee                       NUMERIC(30,0) CONSTRAINT employee_pk PRIMARY KEY DEFAULT NEXTVAL('s_employee'),
    first_name                     VARCHAR(50),
    last_name                      VARCHAR(50),
    emp_code                       VARCHAR(20),
    created_by                     NUMERIC(30,0),
    updated_by                     NUMERIC(30,0),
    current_position               NUMERIC(30,0),
    current_manager                NUMERIC(30,0),
    current_struct_unit            NUMERIC(30,0),
    created                        TIMESTAMP,
    updated                        TIMESTAMP,
    emp_role                       NUMERIC(30,0)
 );






CREATE TABLE cst_type (
    cst_type                       NUMERIC(30,0) CONSTRAINT cst_type_pk PRIMARY KEY ,
    name                           VARCHAR(100)
 );



CREATE SEQUENCE  s_contract_type  START 1;

CREATE TABLE contract_type (
    contract_type                  NUMERIC(30,0) CONSTRAINT contract_type_pk PRIMARY KEY DEFAULT NEXTVAL('s_contract_type'),
    name                          VARCHAR(200)
 );


CREATE SEQUENCE  s_employee_struct_unit  START 1;

CREATE TABLE employee_struct_unit (
    employee_struct_unit           NUMERIC(30,0) CONSTRAINT employee_struct_unit_pk PRIMARY KEY DEFAULT NEXTVAL('s_employee_struct_unit'),
    employee                       NUMERIC(30,0) NOT NULL,
    struct_unit                    NUMERIC(30,0) NOT NULL,
    relation_type                  NUMERIC(30,0) NOT NULL,
    active                         VARCHAR(1),
    valid_from                     TIMESTAMP,
    valid_to                       TIMESTAMP,
    created                        TIMESTAMP,
    created_by                     NUMERIC(30,0),
    updated                        TIMESTAMP,
    updated_by                     NUMERIC(30,0)
 );


CREATE SEQUENCE  s_product_catalog_relation  START 1;

CREATE TABLE product_catalog_relation (
    product_catalog_relation       NUMERIC(30,0) CONSTRAINT product_catalog_relation_pk PRIMARY KEY DEFAULT NEXTVAL('s_product_catalog_relation'),
    upper_catalog                  NUMERIC(30,0),
    lower_catalog                  NUMERIC(30,0),
    note                           VARCHAR(100),
    relation_type                  NUMERIC(30,0)
);


CREATE SEQUENCE  s_order  START 1;

CREATE TABLE order_ (
    order_      NUMERIC(30,0) CONSTRAINT order_pk PRIMARY KEY DEFAULT NEXTVAL('s_order'),
    order_status_type              NUMERIC(30,0),
    order_status_date              TIMESTAMP,
    e_shop_chart                   NUMERIC(30,0),
    contract                       NUMERIC(30,0),
    customer                       NUMERIC(30,0),
    order_number                   VARCHAR(20),
    note                           VARCHAR(300),
    shipping_address               NUMERIC(30,0),
    created_by                     NUMERIC(30,0),
    updated_by                     NUMERIC(30,0),
    created                        TIMESTAMP,
    updated                        TIMESTAMP,
    customer_confirmed             TIMESTAMP,
    customer_confirmed_by          NUMERIC(30,0),
    payd                           TIMESTAMP,
    shipped                        TIMESTAMP,
    confirmed                      TIMESTAMP,
    confirmed_by                   NUMERIC(30,0),
    completed                      TIMESTAMP,
    completed_by                   NUMERIC(30,0),
    order_type                     NUMERIC(30,0),
    d1                             TIMESTAMP,
    n1                             NUMERIC(30,0),
    a1                             VARCHAR(50),
    d2                             TIMESTAMP,
    n2                             NUMERIC(30,0),
    a2                             VARCHAR(50),
    struct_unit                    NUMERIC(30,0),
    offer                          NUMERIC(30,0),
    project                        NUMERIC(30,0),
    payment_type                   NUMERIC(30,0)

);


CREATE SEQUENCE  s_order_item  START 1;

CREATE TABLE order_item (
    order_item       NUMERIC(30,0) CONSTRAINT order_item_pk PRIMARY KEY DEFAULT NEXTVAL('s_order_item'),
    order_                         NUMERIC(30,0),
    item                           NUMERIC(30,0),
    product                        NUMERIC(30,0),
    item_count                     NUMERIC(30,0),
    item_price                     NUMERIC(30,6),
    item_type                      NUMERIC(30,0),
    item_added                     TIMESTAMP
);



CREATE SEQUENCE    s_project  START 1;

CREATE TABLE project (
       project                    NUMERIC(30,0) CONSTRAINT project_pk PRIMARY KEY DEFAULT NEXTVAL('s_project'),
       project_status_type        NUMERIC(30,0) NULL,
       project_type               NUMERIC(30,0) NULL,
       struct_unit                NUMERIC(30,0) NULL,
       manager                    NUMERIC(30,0) NULL,
       last_status_change         TIMESTAMP,
       name                       VARCHAR(200),
       description                VARCHAR(300)
);


CREATE SEQUENCE  s_project_relation  START 1;

CREATE TABLE project_relation (
    project_relation               NUMERIC(30,0) CONSTRAINT project_relation_pk PRIMARY KEY DEFAULT NEXTVAL('s_project_relation'),
    project                        NUMERIC(30,0),
    project1                       NUMERIC(30,0),
    note                           VARCHAR(100),
    relation_type                  NUMERIC(30,0),
    created_by                     NUMERIC(30,0),
    created                        TIMESTAMP
);




CREATE TABLE project_relation_type (
    project_relation_type          NUMERIC(30,0) CONSTRAINT project_relation_type_pk PRIMARY KEY ,
    name                           VARCHAR(100)
);



CREATE TABLE project_status_type (
    project_status_type            NUMERIC(30,0) CONSTRAINT project_status_type_pk PRIMARY KEY ,
    name                           VARCHAR(100),
    description                    VARCHAR(300)
);



CREATE SEQUENCE  s_project_status  START 1;

CREATE TABLE project_status (
    project_status                 NUMERIC(30,0) CONSTRAINT project_status_pk PRIMARY KEY DEFAULT NEXTVAL('s_project_status'),
    project_status_type            NUMERIC(30,0),
    project                        NUMERIC(30,0),
    status_start                   TIMESTAMP, 
    status_end                     TIMESTAMP, 
    prev_status                    NUMERIC(30,0),
    created_by                     NUMERIC(30,0),
    created                        TIMESTAMP
);



CREATE TABLE project_type (
    project_type                   NUMERIC(30,0) CONSTRAINT project_type_pk PRIMARY KEY ,
    name                           VARCHAR(200),
    description                    VARCHAR(300)
);



CREATE SEQUENCE  s_customer_event  START 1;

CREATE TABLE customer_event (
    customer_event                 NUMERIC(30,0) CONSTRAINT customer_event_pk PRIMARY KEY DEFAULT NEXTVAL('s_customer_event'),
    project                        NUMERIC(30,0),
    struct_unit                    NUMERIC(30,0),
    order_                         NUMERIC(30,0),
    customer                       NUMERIC(30,0),
    cust_event_type                NUMERIC(30,0),
    subject                        VARCHAR(300),
    value_text                     VARCHAR(1000),
    created                        TIMESTAMP,
    created_by                     NUMERIC(30,0),
    updated                        TIMESTAMP,
    updated_by                     NUMERIC(30,0)
);

CREATE TABLE cust_event_atrib_type (
       cust_event_atrib_type       NUMERIC(30,0) NOT NULL  CONSTRAINT cust_event_atrib_type_pk PRIMARY KEY ,
       name                        VARCHAR(100) NULL,
       description                 VARCHAR(300) NULL,
       required                    VARCHAR(1) NULL,
       uniq                        VARCHAR(1) NULL,
       selectable                  VARCHAR(1) NULL,
       orderb                      NUMERIC(30,0) NULL,
       active                      VARCHAR(1) NULL,
       created                     TIMESTAMP NULL,
       updated                     TIMESTAMP NULL,
       created_by                  NUMERIC(30,0) NULL,
       updated_by                  NUMERIC(30,0) NULL,
       can_change                  VARCHAR(1) NULL,
       default_value               NUMERIC(30,0) NULL,
       default_value_text          VARCHAR(300) NULL
);

CREATE SEQUENCE    s_cust_event_atrib_value    START 1;

CREATE TABLE cust_event_atrib_value (
       cust_event_atrib_value      NUMERIC(30,0) NOT NULL CONSTRAINT cust_event_atrib_value_pk PRIMARY KEY DEFAULT NEXTVAL('s_cust_event_atrib_value'),
       cust_event_atrib_type       NUMERIC(30,0) NULL,
       value_text                  VARCHAR(300) NULL,
       orderb                      NUMERIC(30,0) NULL,
       active                      VARCHAR(1) NULL,
       created                     TIMESTAMP NULL,
       updated                     TIMESTAMP NULL, 
       created_by                  NUMERIC(30,0) NULL,
       updated_by                  NUMERIC(30,0) NULL
);

CREATE SEQUENCE    s_cust_event_atrib    START 1;

CREATE TABLE cust_event_atrib (
       cust_event_atrib             NUMERIC(30,0) NOT NULL CONSTRAINT cust_event_atrib_pk PRIMARY KEY  DEFAULT NEXTVAL('s_cust_event_atrib'),
       cust_event_atrib_value       NUMERIC(30,0) NULL,
       cust_event_atrib_type        NUMERIC(30,0) NULL,
       customer_event               NUMERIC(30,0) NULL,
       value_text                   VARCHAR(300) NULL,
       selectable                   VARCHAR(1) NULL,
       type_name                    VARCHAR(100) NULL,
       can_change                   VARCHAR(1) NULL,
       created_by                   NUMERIC(30,0) NULL,
       updated_by                   NUMERIC(30,0) NULL,
       orderb                       NUMERIC(30,0) NULL,
       created                      TIMESTAMP NULL,
       updated                      TIMESTAMP NULL
);

CREATE SEQUENCE  s_cust_event_type  START 1;

CREATE TABLE cust_event_type (
    cust_event_type                NUMERIC(30,0) CONSTRAINT cust_event_type_pk PRIMARY KEY DEFAULT NEXTVAL('s_cust_event_type'),
    cust_event_class               NUMERIC(30,0) NULL,
    name                           VARCHAR(200),
    description                    VARCHAR(300)
);


CREATE SEQUENCE  s_cust_event_class  START 1;

CREATE TABLE cust_event_class (
    cust_event_class                NUMERIC(30,0) CONSTRAINT cust_event_class_pk PRIMARY KEY DEFAULT NEXTVAL('s_cust_event_class'),
    name                            VARCHAR(100),
    description                     VARCHAR(300)
);

CREATE SEQUENCE  s_enterprise  START 1;

CREATE TABLE enterprise (
       enterprise          NUMERIC(30,0) CONSTRAINT enteprise_pk PRIMARY KEY DEFAULT NEXTVAL('s_enterprise'),
       ent_type            NUMERIC(30,0) NULL ,
       short_name          VARCHAR(100),
       long_name           VARCHAR(100),
       identity_code       VARCHAR(40),
       note                VARCHAR(1000),
       created             TIMESTAMP,
       updated             TIMESTAMP,
       created_by          NUMERIC(30,0),
       updated_by          NUMERIC(30,0),
       ent_state_type      NUMERIC(30,0) NULL
 );



CREATE SEQUENCE  s_ent_address  START 1;

CREATE TABLE ent_address (
    ent_address                    NUMERIC(30,0) CONSTRAINT ent_address_pk PRIMARY KEY DEFAULT NEXTVAL('s_ent_address'),
    enterprise                     NUMERIC(30,0),
    zip                            VARCHAR(20),
    house                          VARCHAR(100),
    address                        VARCHAR(100),
    county                         VARCHAR(100),
    parish                         VARCHAR(100),
    town_county                    VARCHAR(100),
    address_type                   NUMERIC(30,0),
    phone                          VARCHAR(20),
    sms                            VARCHAR(20),
    mobile                         VARCHAR(20),
    email                          VARCHAR(30),
    note                           VARCHAR(50),
    country                        NUMERIC(30,0),
    created                        TIMESTAMP,
    updated                        TIMESTAMP,
    created_by                     NUMERIC(30,0),
    updated_by                     NUMERIC(30,0)
 );

CREATE SEQUENCE  s_ent_relation  START 1;

CREATE TABLE ent_relation (
    ent_relation                     NUMERIC(30,0) CONSTRAINT ent_relation_pk PRIMARY KEY DEFAULT NEXTVAL('s_ent_relation'),
    enterprise                       NUMERIC(30,0),
    enterprise1                      NUMERIC(30,0),
    note                             VARCHAR(200),
    ent_relation_type                NUMERIC(30,0)
);

CREATE SEQUENCE  s_ent_type  START 1;

CREATE TABLE ent_type (
    ent_type                       NUMERIC(30,0) CONSTRAINT ent_type_pk PRIMARY KEY DEFAULT NEXTVAL('s_ent_type'),
    name                           VARCHAR(100),
    description                    VARCHAR(300)
);



CREATE TABLE ent_relation_type (
    ent_relation_type              NUMERIC(30,0) CONSTRAINT ent_relation_type_pk PRIMARY KEY ,
    name                           VARCHAR(100),
    description                    VARCHAR(300)
);


CREATE SEQUENCE  s_order_relation  START 1;

CREATE TABLE order_relation (
    order_relation                    NUMERIC(30,0) CONSTRAINT order_relation_pk PRIMARY KEY DEFAULT NEXTVAL('s_order_relation'),
    order_                            NUMERIC(30,0),
    order1                            NUMERIC(30,0),
    note                              VARCHAR(200),
    order_relation_type               NUMERIC(30,0),
    created                           TIMESTAMP,
    created_by                        NUMERIC(30,0)
);




CREATE TABLE order_relation_type (
    order_relation_type              NUMERIC(30,0) CONSTRAINT order_relation_type_pk PRIMARY KEY ,
    name                             VARCHAR(100),
    description                      VARCHAR(300)
);



CREATE TABLE order_type (
    order_type                       NUMERIC(30,0) CONSTRAINT order_type_pk PRIMARY KEY ,
    name                             VARCHAR(100),
    description                      VARCHAR(300)
);


CREATE SEQUENCE  s_order_status_class  START 1;

CREATE TABLE order_status_class (
    order_status_class               NUMERIC(30,0) CONSTRAINT order_status_class_pk PRIMARY KEY DEFAULT NEXTVAL('s_order_status_class'),
    name                             VARCHAR(100)
);



CREATE SEQUENCE  s_order_status  START 1;

CREATE TABLE order_status (
    order_status                     NUMERIC(30,0) CONSTRAINT order_status_pk PRIMARY KEY DEFAULT NEXTVAL('s_order_status'),
    order_                           NUMERIC(30,0),
    valid_from                       TIMESTAMP,
    valid_to                         TIMESTAMP,
    created_by                       NUMERIC(30,0),
    order_status_type                NUMERIC(30,0),
    created                          TIMESTAMP,
    ended                            TIMESTAMP,
    ended_by                         NUMERIC(30,0)
);

CREATE SEQUENCE  s_order_status_type  START 1;

CREATE TABLE order_status_type (
    order_status_type                NUMERIC(30,0) CONSTRAINT order_status_type_pk PRIMARY KEY DEFAULT NEXTVAL('s_order_status_type'),
    order_status_class               NUMERIC(30,0),
    name                             VARCHAR(100)
);


CREATE SEQUENCE  s_order_customer  START 1;

CREATE TABLE order_customer (
    order_customer                NUMERIC(30,0) CONSTRAINT order_customer_pk PRIMARY KEY DEFAULT NEXTVAL('s_order_customer'),
    customer                      NUMERIC(30,0),
    order_                        NUMERIC(30,0),
    created                       TIMESTAMP,
    created_by                    NUMERIC(30,0),
    relation_type                 NUMERIC(30,0)
);



CREATE SEQUENCE  s_paym_graph  START 1;

CREATE TABLE paym_graph (
    paym_graph                    NUMERIC(30,0) CONSTRAINT paym_graph_pk PRIMARY KEY DEFAULT NEXTVAL('s_paym_graph'),
    payment_type                  NUMERIC(30,0),
    customer                      NUMERIC(30,0),
    order_                        NUMERIC(30,0),
    payment_total                 NUMERIC(32,16),
    due_date                      TIMESTAMP,
    created                       TIMESTAMP,
    created_by                    NUMERIC(30,0),
    updated                       TIMESTAMP,
    updated_by                    NUMERIC(30,0),
    contract                      NUMERIC(30,0),
    status                        NUMERIC(30,0)
);



CREATE SEQUENCE  s_paym_part  START 1;

CREATE TABLE paym_part  (
    paym_part                    NUMERIC(30,0) CONSTRAINT paym_part_pk PRIMARY KEY DEFAULT NEXTVAL('s_paym_part'),
    paym_graph                   NUMERIC(30,0),
    paym_part_type               NUMERIC(30,0),
    paym_amount                  NUMERIC(32,16)
);




CREATE TABLE paym_part_type  (
    paym_part_type                    NUMERIC(30,0) CONSTRAINT paym_part_type_pk PRIMARY KEY ,
    name                              VARCHAR(100),
    description                       VARCHAR(300)

);




CREATE TABLE payment_type (
    payment_type                     NUMERIC(30,0) CONSTRAINT payment_type_pk PRIMARY KEY ,
    name                             VARCHAR(100)
);

CREATE SEQUENCE  s_c_group  START 1;

CREATE TABLE c_group (
    c_group                     NUMERIC(30,0) CONSTRAINT c_group_pk PRIMARY KEY DEFAULT NEXTVAL('s_c_group'),
    struct_unit                 NUMERIC(30,0),
    name                        VARCHAR(100),
    description                 VARCHAR(300),
    created                     TIMESTAMP,
    created_by                  NUMERIC(30,0),
    updated                     TIMESTAMP,
    updated_by                  NUMERIC(30,0)
);


CREATE SEQUENCE  s_customer_group  START 1;

CREATE TABLE customer_group (
    customer_group                    NUMERIC(30,0) CONSTRAINT customer_group_pk PRIMARY KEY DEFAULT NEXTVAL('s_customer_group'),
    customer                          NUMERIC(30,0),
    c_group                           NUMERIC(30,0),
    created                           TIMESTAMP,
    created_by                        NUMERIC(30,0)
);


CREATE SEQUENCE  s_contract_relation  START 1;

CREATE TABLE contract_relation (
    contract_relation                 NUMERIC(30,0) CONSTRAINT contract_relation_pk PRIMARY KEY DEFAULT NEXTVAL('s_contract_relation'),
    contract                          NUMERIC(30,0),
    contract1                         NUMERIC(30,0),
    relation_type                     NUMERIC(30,0),
    valid_from                        TIMESTAMP,
    valid_to                          TIMESTAMP,
    created                           TIMESTAMP,
    created_by                        NUMERIC(30,0),
    updated                           TIMESTAMP,
    updated_by                        NUMERIC(30,0),
    status                            NUMERIC(30,0)
);


CREATE SEQUENCE  s_emp_user  START 1;

CREATE TABLE emp_user (
    emp_user                          NUMERIC(30,0) CONSTRAINT emp_user_pk PRIMARY KEY DEFAULT NEXTVAL('s_emp_user'),
    employee                          NUMERIC(30,0),
    username                          VARCHAR(20),
    passw                             VARCHAR(300),
    user_status_type                  NUMERIC(30,0),
    created                           TIMESTAMP,
    created_by                        NUMERIC(30,0),
    updated                           TIMESTAMP,
    updated_by                        NUMERIC(30,0),
    last_session                      NUMERIC(30,0),
    contact_email                     VARCHAR(20)
);


CREATE SEQUENCE  s_contract_manager  START 1;

CREATE TABLE contract_manager (
    contract_manager                  NUMERIC(30,0) CONSTRAINT contract_manager_pk PRIMARY KEY DEFAULT NEXTVAL('s_contract_manager'),
    contract                          NUMERIC(30,0),
    employee                          NUMERIC(30,0),
    valid_from                        TIMESTAMP,
    valid_to                          TIMESTAMP,
    status                            NUMERIC(30,0),
    created                           TIMESTAMP,
    created_by                        NUMERIC(30,0),
    updated                           TIMESTAMP,
    updated_by                        NUMERIC(30,0)
);


CREATE SEQUENCE  s_contract_status  START 1;

CREATE TABLE contract_status (
    contract_status                   NUMERIC(30,0) CONSTRAINT contract_status_pk PRIMARY KEY DEFAULT NEXTVAL('s_contract_status'),
    contract                          NUMERIC(30,0),
    contract_status_type              NUMERIC(30,0),
    valid_from                        TIMESTAMP,
    valid_to                          TIMESTAMP,
    status                            NUMERIC(30,0),
    created                           TIMESTAMP,
    created_by                        NUMERIC(30,0),
    ended                             TIMESTAMP,
    ended_by                          NUMERIC(30,0)
);


CREATE SEQUENCE  s_cst_state_type  START 1;

CREATE TABLE cst_state_type (
    cst_state_type                   NUMERIC(30,0) CONSTRAINT cst_state_type_pk PRIMARY KEY DEFAULT NEXTVAL('s_cst_state_type'),
    name                             VARCHAR(100)
);



CREATE TABLE product_atr_type (
    product_atr_type               NUMERIC(30,0) CONSTRAINT product_atr_type_pk PRIMARY KEY ,
       name                        VARCHAR(100) NULL,
       description                 VARCHAR(300) NULL,
       required                    VARCHAR(1) NULL,
       uniq                        VARCHAR(1) NULL,
       selectable                  VARCHAR(1) NULL,
       orderb                      NUMERIC(30,0) NULL,
       active                      VARCHAR(1) NULL,
       created                     TIMESTAMP NULL,
       updated                     TIMESTAMP NULL,
       created_by                  NUMERIC(30,0) NULL,
       updated_by                  NUMERIC(30,0) NULL,
       can_change                  VARCHAR(1) NULL,
       default_value               NUMERIC(30,0) NULL,
       default_value_text          VARCHAR(300) NULL
);


CREATE SEQUENCE  s_product_catalog_atr_type  START 1;

CREATE TABLE product_catalog_atr_type (
       product_catalog_atr_type      NUMERIC(30,0) CONSTRAINT product_catalog_atr_type_pk PRIMARY KEY DEFAULT NEXTVAL('s_product_catalog_atr_type'),
       product_catalog               NUMERIC(30,0) NULL,
       product_atr_type              NUMERIC(30,0) NULL,
       valid_from                    TIMESTAMP,
       valid_to                      TIMESTAMP,
       orderb                        NUMERIC(30,0) NULL,
       status                        NUMERIC(30,0) NULL
);


CREATE SEQUENCE    s_product_attribute    START 1;

CREATE TABLE product_attribute  (
       product_attribute            NUMERIC(30,0) NOT NULL CONSTRAINT product_attribute_pk PRIMARY KEY  DEFAULT NEXTVAL('s_product_attribute'),
       product_atr_type_value       NUMERIC(30,0) NULL,
       product_atr_type             NUMERIC(30,0) NULL,
       product                      NUMERIC(30,0) NULL,
       value_text                   VARCHAR(300) NULL,
       selectable                   VARCHAR(1) NULL,
       type_name                    VARCHAR(100) NULL,
       can_change                   VARCHAR(1) NULL,
       orderb                       NUMERIC(30,0) NULL,
       created_by                   NUMERIC(30,0) NULL,
       updated_by                   NUMERIC(30,0) NULL,
       created                      TIMESTAMP NULL,
       updated                      TIMESTAMP NULL
);

CREATE SEQUENCE    s_product_atr_type_value    START 1;

CREATE TABLE product_atr_type_value (
       product_atr_type_value      NUMERIC(30,0) NOT NULL CONSTRAINT product_atr_type_value_pk PRIMARY KEY DEFAULT NEXTVAL('s_product_atr_type_value'),
       product_atr_type            NUMERIC(30,0) NULL,
       value_text                  VARCHAR(300) NULL,
       orderb                      NUMERIC(30,0) NULL,
       active                      VARCHAR(1) NULL,
       created                     TIMESTAMP NULL,
       updated                     TIMESTAMP NULL, 
       created_by                  NUMERIC(30,0) NULL,
       updated_by                  NUMERIC(30,0) NULL
);




CREATE TABLE contract_atr_type (
       contract_atr_type           NUMERIC(30,0) CONSTRAINT contract_atr_type_pk PRIMARY KEY ,
       name                        VARCHAR(100) NULL,
       valid_from                  TIMESTAMP NULL,
       valid_to                    TIMESTAMP NULL,
       required                    VARCHAR(1) NULL,
       uniq                        VARCHAR(1) NULL,
       selectable                  VARCHAR(1) NULL,
       orderb                      NUMERIC(30,0) NULL,
       active                      VARCHAR(1) NULL,
       created                     TIMESTAMP NULL,
       updated                     TIMESTAMP NULL,
       created_by                  NUMERIC(30,0) NULL,
       updated_by                  NUMERIC(30,0) NULL,
       can_change                  VARCHAR(1) NULL,
       default_value               NUMERIC(30,0) NULL,
       default_value_text          VARCHAR(300) NULL
);


CREATE SEQUENCE    s_contract_atr_type_value    START 1;

CREATE TABLE contract_atr_type_value (
       contract_atr_type_value      NUMERIC(30,0) NOT NULL CONSTRAINT contract_atr_type_value_pk PRIMARY KEY DEFAULT NEXTVAL('s_contract_atr_type_value'),
       contract_atr_type            NUMERIC(30,0) NULL,
       value_text                   VARCHAR(300) NULL,
       orderb                       NUMERIC(30,0) NULL,
       active                       VARCHAR(1) NULL,
       created                      TIMESTAMP NULL,
       updated                      TIMESTAMP NULL, 
       created_by                   NUMERIC(30,0) NULL,
       updated_by                   NUMERIC(30,0) NULL
);

CREATE SEQUENCE    s_contract_attribute    START 1;

CREATE TABLE contract_attribute  (
       contract_attribute            NUMERIC(30,0) NOT NULL CONSTRAINT contract_attribute_pk PRIMARY KEY  DEFAULT NEXTVAL('s_contract_attribute'),
       contract_atr_type_value       NUMERIC(30,0) NULL,
       contract_atr_type             NUMERIC(30,0) NULL,
       contract                      NUMERIC(30,0) NULL,
       value_text                   VARCHAR(300) NULL,
       selectable                   VARCHAR(1) NULL,
       type_name                    VARCHAR(100) NULL,
       can_change                   VARCHAR(1) NULL,
       orderb                       NUMERIC(30,0) NULL,
       created_by                   NUMERIC(30,0) NULL,
       updated_by                   NUMERIC(30,0) NULL,
       created                      TIMESTAMP NULL,
       updated                      TIMESTAMP NULL
);


CREATE SEQUENCE    s_contract_type_atrib    START 1;

CREATE TABLE contract_type_atrib (
       contract_type_atrib          NUMERIC(30,0) NOT NULL CONSTRAINT contract_type_atrib_pk PRIMARY KEY DEFAULT NEXTVAL('s_contract_type_atrib'),
       contract_atr_type            NUMERIC(30,0) NULL,
       contract_type                NUMERIC(30,0) NULL,
       valid_from                   TIMESTAMP NULL,
       valid_to                     TIMESTAMP NULL,
       status                       NUMERIC(30,0) NULL,
       orderb                       NUMERIC(30,0) NULL
);



CREATE SEQUENCE    s_cst_app_session    START 1;

CREATE TABLE cst_app_session (
       cst_app_session              NUMERIC(30,0) NOT NULL CONSTRAINT cst_app_session_pk PRIMARY KEY DEFAULT NEXTVAL('s_cst_app_session'),
       customer                     NUMERIC(30,0) NULL,
       cst_user                     NUMERIC(30,0) NULL,
       session_id                   VARCHAR(200) NULL,
       session_start                TIMESTAMP NULL,
       session_end                  TIMESTAMP NULL,
       last_action                  TIMESTAMP NULL,
       app_id                       VARCHAR(10) NULL,
       status_type                  NUMERIC(30,0) NULL
);


CREATE SEQUENCE    s_emp_app_session    START 1;

CREATE TABLE emp_app_session (
       emp_app_session              NUMERIC(30,0) NOT NULL CONSTRAINT emp_app_session_pk PRIMARY KEY DEFAULT NEXTVAL('s_emp_app_session'),
       employee                     NUMERIC(30,0) NULL,
       emp_user                     NUMERIC(30,0) NULL,
       session_id                   VARCHAR(200) NULL,
       session_start                TIMESTAMP NULL,
       session_end                  TIMESTAMP NULL,
       last_action                  TIMESTAMP NULL,
       app_id                       VARCHAR(10) NULL,
       status_type                  NUMERIC(30,0) NULL
);

CREATE SEQUENCE  s_contract_status_type  START 1;

CREATE TABLE contract_status_type (
    contract_status_type                   NUMERIC(30,0) CONSTRAINT contract_status_type_pk PRIMARY KEY DEFAULT NEXTVAL('s_contract_status_type'),
    name                                   VARCHAR(100)
);


CREATE SEQUENCE  s_catalog_type  START 1;

CREATE TABLE catalog_type (
    catalog_type                   NUMERIC(30,0) CONSTRAINT catalog_type_pk PRIMARY KEY DEFAULT NEXTVAL('s_catalog_type'),
    name                           VARCHAR(100)
);

CREATE SEQUENCE  s_enterprise_customer  START 1;

CREATE TABLE enterprise_customer (
    enterprise_customer           NUMERIC(30,0) CONSTRAINT enterprise_customer_pk PRIMARY KEY DEFAULT NEXTVAL('s_enterprise_customer'),
    customer                      NUMERIC(30,0),
    enterprise                    NUMERIC(30,0),
    created                       TIMESTAMP,
    created_by                    NUMERIC(30,0),
    relation_type                 NUMERIC(30,0),
    note                         VARCHAR(100) NULL
);




CREATE TABLE ent_customer_relation_type (
    ent_customer_relation_type    NUMERIC(30,0) CONSTRAINT ent_customer_relation_type_pk PRIMARY KEY ,
    name                          VARCHAR(100) NULL,
    description                   VARCHAR(300) NULL
);


CREATE SEQUENCE  s_comm_device_type  START 1;

CREATE TABLE comm_device_type (
    comm_device_type              NUMERIC(30,0) CONSTRAINT comm_device_type_pk PRIMARY KEY DEFAULT NEXTVAL('s_comm_device_type'),
    name                          VARCHAR(100) NULL,
    description                   VARCHAR(300) NULL
);

CREATE SEQUENCE  s_comm_device   START 1;

CREATE TABLE comm_device  (
    comm_device                   NUMERIC(30,0) CONSTRAINT comm_device_pk PRIMARY KEY DEFAULT NEXTVAL('s_comm_device'),
    comm_device_type              NUMERIC(30,0) NULL,
    customer                      NUMERIC(30,0) NULL,
    value_text                    VARCHAR(100) NULL,
    orderb                        NUMERIC(30,0) NULL,
    created                       TIMESTAMP
);



CREATE TABLE CUST_MESSAGE_TYPE (
    cust_message_type             NUMERIC(30,0) CONSTRAINT cust_message_type_pk PRIMARY KEY ,
    name                          VARCHAR(100) NULL);



CREATE TABLE CUST_MESSAGE_STATUS_TYPE (
    cust_message_status_type           NUMERIC(30,0) CONSTRAINT cust_message_status_type_pk PRIMARY KEY ,
    name                               VARCHAR(100) NULL);


CREATE SEQUENCE  s_customer_message   START 1;

CREATE TABLE customer_message  (
    customer_message          NUMERIC(30,0) CONSTRAINT customer_message_pk PRIMARY KEY DEFAULT NEXTVAL('s_customer_message'),
    cust_message_type         NUMERIC(30,0) NULL,
    customer                  NUMERIC(30,0) NULL,
    cust_message_status_type  NUMERIC(30,0) NULL,
    subject                   VARCHAR(300) NULL,
    value_text                VARCHAR(600) NULL,
    orderb                    NUMERIC(30,0) NULL,
    created                   TIMESTAMP NULL,
    created_by                NUMERIC(30,0) NULL,
    show_start                TIMESTAMP NULL,
    show_end                  TIMESTAMP NULL
);




CREATE TABLE customer_atr_type (
    customer_atr_type               NUMERIC(30,0) CONSTRAINT customer_atr_type_pk PRIMARY KEY ,
       name                        VARCHAR(100) NULL,
       description                 VARCHAR(300) NULL,
       required                    VARCHAR(1) NULL,
       uniq                        VARCHAR(1) NULL,
       selectable                  VARCHAR(1) NULL,
       orderb                      NUMERIC(30,0) NULL,
       active                      VARCHAR(1) NULL,
       created                     TIMESTAMP NULL,
       updated                     TIMESTAMP NULL,
       created_by                  NUMERIC(30,0) NULL,
       updated_by                  NUMERIC(30,0) NULL,
       can_change                  VARCHAR(1) NULL,
       default_value               NUMERIC(30,0) NULL,
       default_value_text          VARCHAR(300) NULL
);


CREATE SEQUENCE    s_customer_attribute    START 1;

CREATE TABLE customer_attribute  (
       customer_attribute            NUMERIC(30,0) NOT NULL CONSTRAINT customer_attribute_pk PRIMARY KEY  DEFAULT NEXTVAL('s_customer_attribute'),
       customer_atr_type_value       NUMERIC(30,0) NULL,
       customer_atr_type             NUMERIC(30,0) NULL,
       customer                      NUMERIC(30,0) NULL,
       value_text                    VARCHAR(300) NULL,
       selectable                    VARCHAR(1) NULL,
       type_name                     VARCHAR(100) NULL,
       can_change                    VARCHAR(1) NULL,
       orderb                        NUMERIC(30,0) NULL,
       created_by                    NUMERIC(30,0) NULL,
       updated_by                    NUMERIC(30,0) NULL,
       created                       TIMESTAMP NULL,
       updated                       TIMESTAMP NULL
);


CREATE SEQUENCE    s_customer_atr_type_value    START 1;

CREATE TABLE customer_atr_type_value (
       customer_atr_type_value      NUMERIC(30,0) NOT NULL CONSTRAINT customer_atr_type_value_pk PRIMARY KEY DEFAULT NEXTVAL('s_customer_atr_type_value'),
       customer_atr_type            NUMERIC(30,0) NULL,
       value_text                  VARCHAR(300) NULL,
       orderb                      NUMERIC(30,0) NULL,
       active                      VARCHAR(1) NULL,
       created                     TIMESTAMP NULL,
       updated                     TIMESTAMP NULL, 
       created_by                  NUMERIC(30,0) NULL,
       updated_by                  NUMERIC(30,0) NULL
);


CREATE SEQUENCE    s_cst_type_atr_type    START 1;

CREATE TABLE cst_type_atr_type (
       cst_type_atr_type NUMERIC(30,0) NOT NULL CONSTRAINT cst_type_atr_type_pk PRIMARY KEY DEFAULT NEXTVAL('s_cst_type_atr_type'),
       cst_type                      NUMERIC(30,0) NULL,
       customer_atr_type             NUMERIC(30,0) NULL,
       active                        VARCHAR(1) NULL
);


CREATE TABLE EMP_ROLE (
    emp_role                           NUMERIC(30,0) CONSTRAINT emp_role_pk PRIMARY KEY ,
    name                               VARCHAR(100) NULL);


CREATE SEQUENCE    s_property    START 1;

CREATE TABLE property  (
       property                    NUMERIC(30,0) NOT NULL CONSTRAINT property_pk PRIMARY KEY  DEFAULT NEXTVAL('s_property'),
       property_type               NUMERIC(30,0) NULL,
       property_status_type        NUMERIC(30,0) NULL,
       name                        VARCHAR(100) NULL,
       description                 VARCHAR(1000) NULL,
       note                        VARCHAR(200) NULL,
       value_amount                NUMERIC (32,16) NULL,
       created                     TIMESTAMP NULL,
       updated                     TIMESTAMP NULL, 
       created_by                  NUMERIC(30,0) NULL,
       updated_by                  NUMERIC(30,0) NULL

);

CREATE TABLE property_atr_type (
       property_atr_type           NUMERIC(30,0) CONSTRAINT property_atr_type_pk PRIMARY KEY ,
       name                        VARCHAR(100) NULL,
       description                 VARCHAR(300) NULL,
       required                    VARCHAR(1) NULL,
       uniq                        VARCHAR(1) NULL,
       selectable                  VARCHAR(1) NULL,
       orderb                      NUMERIC(30,0) NULL,
       active                      VARCHAR(1) NULL,
       created                     TIMESTAMP NULL,
       updated                     TIMESTAMP NULL,
       created_by                  NUMERIC(30,0) NULL,
       updated_by                  NUMERIC(30,0) NULL,
       can_change                  VARCHAR(1) NULL,
       default_value               NUMERIC(30,0) NULL,
       default_value_text          VARCHAR(300) NULL
);


CREATE SEQUENCE    s_property_atr_value    START 1;

CREATE TABLE property_atr_value (
       property_atr_value          NUMERIC(30,0) NOT NULL CONSTRAINT property_atrib_value_pk PRIMARY KEY DEFAULT NEXTVAL('s_property_atr_value'),
       property_atr_type           NUMERIC(30,0) NULL,
       value_text                  VARCHAR(300) NULL,
       orderb                      NUMERIC(30,0) NULL,
       active                      VARCHAR(1) NULL,
       created                     TIMESTAMP NULL,
       updated                     TIMESTAMP NULL, 
       created_by                  NUMERIC(30,0) NULL,
       updated_by                  NUMERIC(30,0) NULL
);

CREATE SEQUENCE    s_property_attribute    START 1;

CREATE TABLE property_attribute  (
       property_attribute            NUMERIC(30,0) NOT NULL CONSTRAINT property_attribute_pk PRIMARY KEY  DEFAULT NEXTVAL('s_property_attribute'),
       property_atr_value            NUMERIC(30,0) NULL,
       property_atr_type             NUMERIC(30,0) NULL,
       property                      NUMERIC(30,0) NULL,
       value_text                    VARCHAR(300) NULL,
       selectable                    VARCHAR(1) NULL,
       type_name                     VARCHAR(100) NULL,
       can_change                    VARCHAR(1) NULL,
       orderb                        NUMERIC(30,0) NULL,
       created_by                    NUMERIC(30,0) NULL,
       updated_by                    NUMERIC(30,0) NULL,
       created                       TIMESTAMP NULL,
       updated                       TIMESTAMP NULL
);


CREATE SEQUENCE  s_property_status  START 1;

CREATE TABLE property_status (
    property_status                 NUMERIC(30,0) CONSTRAINT property_status_pk PRIMARY KEY DEFAULT NEXTVAL('s_property_status'),
    property_status_type            NUMERIC(30,0),
    property                        NUMERIC(30,0),
    status_start                    TIMESTAMP, 
    status_end                      TIMESTAMP, 
    prev_status                     NUMERIC(30,0),
    created_by                      NUMERIC(30,0),
    created                         TIMESTAMP
);


CREATE SEQUENCE  s_contract_property  START 1;

CREATE TABLE contract_property (
    contract_property               NUMERIC(30,0) CONSTRAINT contract_property_pk PRIMARY KEY DEFAULT NEXTVAL('s_contract_property'),
    contract                        NUMERIC(30,0) NULL,
    property                        NUMERIC(30,0) NULL,
    status                          NUMERIC(30,0) NULL,
    note                            VARCHAR(100) NULL,
    relation_type                   NUMERIC(30,0) NULL,
    created_by                      NUMERIC(30,0) NULL,
    updated_by                      NUMERIC(30,0) NULL,
    created                         TIMESTAMP NULL,
    updated                         TIMESTAMP NULL
);


CREATE TABLE property_status_type (
    property_status_type               NUMERIC(30,0) CONSTRAINT property_status_type_pk PRIMARY KEY ,
    name                               VARCHAR(100) NULL,
    description                        VARCHAR(300) NULL
);


CREATE TABLE property_class (
    property_class                     NUMERIC(30,0) CONSTRAINT property_class_pk PRIMARY KEY ,
    name                               VARCHAR(100) NULL,
    description                        VARCHAR(300) NULL
);


CREATE TABLE property_type (
    property_type                      NUMERIC(30,0) CONSTRAINT property_type_pk PRIMARY KEY ,
    name                               VARCHAR(100) NULL,
    description                        VARCHAR(300) NULL,
    property_class                     NUMERIC(30,0) NULL
);

CREATE SEQUENCE  s_property_relation START 1;

CREATE TABLE property_relation (
       property_relation             NUMERIC(30,0) CONSTRAINT property_relation_pk PRIMARY KEY DEFAULT NEXTVAL('s_property_relation'),
       property                      NUMERIC(30,0) NULL,
       property1                     NUMERIC(30,0) NULL,
       note                          VARCHAR(100) NULL,
       status                        NUMERIC(30,0) NULL,
       relation_type                 NUMERIC(30,0) NULL,
       created_by                    NUMERIC(30,0) NULL,
       updated_by                    NUMERIC(30,0) NULL,
       created                       TIMESTAMP NULL,
       updated                       TIMESTAMP NULL
);

CREATE SEQUENCE  s_prop_type_atrib START 1;

CREATE TABLE prop_type_atrib (
       prop_type_atrib               NUMERIC(30,0) CONSTRAINT prop_type_atrib_pk PRIMARY KEY DEFAULT NEXTVAL('s_prop_type_atrib'),
       property_type                 NUMERIC(30,0) NULL,
       property_atr_type             NUMERIC(30,0) NULL,
       active                        VARCHAR(1) NULL );



/* CUSTOMER tabeli indeksid ja piirangud */

CREATE  INDEX customer_idx1
 ON customer
  ( customer ) ;


CREATE  INDEX customer_idx2
 ON customer
  ( last_name varchar_pattern_ops ) ;

CREATE  INDEX customer_idx3
 ON customer
  ( identity_code varchar_pattern_ops ) ;


CREATE  INDEX customer_idx5
 ON customer
  ( cst_state_type ) ;

CREATE  INDEX customer_idx6
 ON customer
  ( first_name varchar_pattern_ops) ;

CREATE  INDEX customer_idx7
 ON customer
  ( created ) ;

CREATE  INDEX customer_idx8
 ON customer
  ( created_by ) ;

CREATE  INDEX customer_idx9
 ON customer
  ( updated ) ;

CREATE  INDEX customer_idx10
 ON customer
  ( updated_by ) ;

CREATE  INDEX customer_idx11
 ON customer
  ( note varchar_pattern_ops) ;

/* CONTRACT tabeli indeksid ja piirangud */



CREATE  INDEX contract_idx1
 ON contract
  ( contract) ;


CREATE  INDEX contract_idx2
 ON contract
  ( contract_manager ) ;

CREATE  INDEX contract_idx3
 ON contract
  ( customer ) ;

CREATE  INDEX contract_idx4
 ON contract
  ( cnt_number varchar_pattern_ops) ;


CREATE  INDEX contract_idx5
 ON contract
  ( name ) ;

CREATE  INDEX contract_idx6
 ON contract
  ( valid_from ) ;

CREATE  INDEX contract_idx7
 ON contract
  ( valid_to ) ;

CREATE  INDEX contract_idx8
 ON contract
  ( created ) ;

CREATE  INDEX contract_idx9
 ON contract
  ( created_by ) ;

CREATE  INDEX contract_idx10
 ON contract
  ( updated ) ;

CREATE  INDEX contract_idx11
 ON contract
  ( updated_by ) ;

CREATE  INDEX contract_idx12
 ON contract
  ( struct_unit ) ;



/* CST_STATE_TYPE tabeli indeksid ja piirangud */



/* CST_TYPE tabeli indeksid ja piirangud */




/* CUSTOMER_GROUP tabeli indeksid ja piirangud */



CREATE  INDEX customer_group_idx1
 ON customer_group
  ( customer ) ;

CREATE  INDEX customer_group_idx2
 ON customer_group
  ( c_group ) ;

CREATE  INDEX customer_group_idx3
 ON customer_group
  ( customer_group ) ;

CREATE  INDEX customer_group_idx4
 ON customer_group
  ( customer_group ) ;



/* CONTRACT_TYPE tabeli indeksid ja piirangud */



/* CONTRACT_ATTRIBUTE tabeli indeksid ja piirangud */


CREATE  INDEX contract_attribute_idx1
 ON contract_attribute
  ( contract ) ;

CREATE  INDEX contract_attribute_idx2
 ON contract_attribute
  ( value_text varchar_pattern_ops) ;

CREATE  INDEX contract_attribute_idx3
 ON contract_attribute
  ( contract_atr_type ) ;


CREATE  INDEX contract_attribute_idx4
 ON contract_attribute
  ( contract_atr_type_value ) ;


CREATE  INDEX contract_attribute_idx5
 ON contract_attribute
  ( contract_attribute ) ;



/* CONTRACT_ATR_TYPE tabeli indeksid ja piirangud */



/* CONTRACT_STATUS tabeli indeksid ja piirangud */


CREATE  INDEX contract_status_idx1
 ON contract_status
  ( contract ) ;

CREATE  INDEX contract_status_idx2
 ON contract_status
  ( contract_status_type ) ;

CREATE  INDEX contract_status_idx3
 ON contract_status
  ( valid_from) ;


CREATE  INDEX contract_status_idx4
 ON contract_status
  ( valid_to) ;

CREATE  INDEX contract_status_idx5
 ON contract_status
  ( contract_status) ;

/* CONTRACT_STATUS_TYPE tabeli indeksid ja piirangud */



/* CONTRACT_MANAGER tabeli indeksid ja piirangud */



CREATE  INDEX contract_manager_idx1
 ON contract_manager
  ( contract) ;

CREATE  INDEX contract_manager_idx2
 ON contract_manager
  ( employee) ;


CREATE  INDEX contract_manager_idx3
 ON contract_manager
  ( contract_manager) ;



/* CONTRACT_RELATION tabeli indeksid ja piirangud */



CREATE  INDEX contract_relation_idx1
 ON contract_relation
  ( contract) ;

CREATE  INDEX contract_relation_idx2
 ON contract_relation
  ( contract1) ;

CREATE  INDEX contract_relation_idx3
 ON contract_relation
  ( relation_type) ;

CREATE  INDEX contract_relation_idx4
 ON contract_relation
  ( contract_relation) ;

/* C_GROUP tabeli indeksid ja piirangud */



CREATE  INDEX c_group_idx1
 ON c_group
  ( struct_unit) ;

CREATE  INDEX c_group_idx2
 ON c_group
  ( c_group) ;


/* STRUCT_UNIT tabeli indeksid ja piirangud */



CREATE  INDEX struct_unit_idx1
 ON struct_unit
  ( upper_unit) ;

CREATE  INDEX struct_unit_idx2
 ON struct_unit
  ( unit_code varchar_pattern_ops) ;

CREATE  INDEX struct_unit_idx3
 ON struct_unit
  ( struct_unit) ;



/* EMPLOYEE_STRUCT_UNIT tabeli indeksid ja piirangud */



CREATE  INDEX employee_struct_unit_idx1
 ON employee_struct_unit
  ( struct_unit) ;


CREATE  INDEX employee_struct_unit_idx2
 ON employee_struct_unit
  ( employee) ;

CREATE  INDEX employee_struct_unit_idx3
 ON employee_struct_unit
  ( employee_struct_unit) ;



/* CST_APP_SESSION tabeli indeksid ja piirangud */



CREATE  INDEX cst_app_session_idx1
 ON cst_app_session
  ( customer) ;

CREATE  INDEX cst_app_session_idx2
 ON cst_app_session
  ( cst_user) ;

CREATE  INDEX cst_app_session_idx3
 ON cst_app_session
  ( cst_app_session) ;



/* CST_USER tabeli indeksid ja piirangud */


CREATE  UNIQUE INDEX cst_user_ux1
 ON cst_user
  ( username  varchar_pattern_ops);

CREATE  INDEX cst_user_idx1
 ON cst_user
  ( customer) ;

CREATE  INDEX cst_user_idx2
 ON cst_user
  ( passw varchar_pattern_ops) ;

CREATE  INDEX cst_user_idx3
 ON cst_user
  ( cst_user) ;

/* COMM_DEVICE_TYPE tabeli indeksid ja piirangud */



/* COMM_DEVICE tabeli indeksid ja piirangud */


CREATE  INDEX comm_device_idx1
 ON comm_device
  ( customer) ;

CREATE  INDEX comm_device_idx2
 ON comm_device
  ( comm_device_type) ;

CREATE  INDEX comm_device_idx3
 ON comm_device
  ( value_text varchar_pattern_ops) ;

CREATE  INDEX comm_device_idx4
 ON comm_device
  ( comm_device) ;


/* CST_ADDRESS tabeli indeksid ja piirangud */


CREATE  INDEX cst_address_idx1
 ON cst_address
  ( customer  ) ;

CREATE  INDEX cst_address_idx2
 ON cst_address
  ( address varchar_pattern_ops ) ;

CREATE  INDEX cst_address_idx3
 ON cst_address
  ( county varchar_pattern_ops) ;


CREATE  INDEX cst_address_idx4
 ON cst_address
  ( house varchar_pattern_ops) ;

CREATE  INDEX cst_address_idx5
 ON cst_address
  ( town_county varchar_pattern_ops) ;

CREATE  INDEX cst_address_idx6
 ON cst_address
  ( zip varchar_pattern_ops) ;

CREATE  INDEX cst_address_idx7
 ON cst_address
  ( email varchar_pattern_ops) ;

CREATE  INDEX cst_address_idx8
 ON cst_address
  ( cst_address) ;

/* ORDER_ tabeli indeksid ja piirangud */


CREATE  INDEX order_idx1
 ON order_
  ( customer) ;


CREATE  INDEX order_idx2
 ON order_
  ( contract) ;

CREATE  INDEX order_idx3
 ON order_
  ( order_number varchar_pattern_ops) ;

CREATE  INDEX order_idx4
 ON order_
  ( created_by) ;


CREATE  INDEX order_idx5
 ON order_
  ( created) ;

CREATE  INDEX order_idx6
 ON order_
  ( updated) ;

CREATE  INDEX order_idx7
 ON order_
  ( updated_by) ;


CREATE  INDEX order_idx8
 ON order_
  ( customer_confirmed) ;


CREATE  INDEX order_idx9
 ON order_
  ( shipping_address) ;

CREATE  INDEX order_idx10
 ON order_
  ( order_status_date) ;


CREATE  INDEX order_idx11
 ON order_
  ( order_status_type) ;

CREATE  INDEX order_idx12
 ON order_
  ( project) ;

CREATE  INDEX order_idx13
 ON order_
  ( offer) ;

CREATE  INDEX order_idx14
 ON order_
  ( order_) ;


/* ORDER_ITEM tabeli indeksid ja piirangud */



CREATE  INDEX order_item_idx1
 ON order_item
  ( order_) ;



CREATE  INDEX order_item_idx2
 ON order_item
  ( product) ;

CREATE  INDEX order_item_idx3
 ON order_item
  ( order_item ) ;


/* ORDER_CUSTOMER tabeli indeksid ja piirangud */



CREATE  INDEX order_customer_idx1
 ON order_customer
  ( customer) ;

CREATE  INDEX order_customer_idx2
 ON order_customer
  ( order_) ;

CREATE  INDEX order_customer_idx3
 ON order_customer
  ( order_customer) ;


/* ORDER_STATUS tabeli indeksid ja piirangud */



CREATE  INDEX order_status_idx1
 ON order_status
  ( order_) ;

CREATE  INDEX order_status_idx2
 ON order_status
  ( order_status_type) ;

CREATE  INDEX order_status_idx3
 ON order_status
  ( valid_from) ;

CREATE  INDEX order_status_idx4
 ON order_status
  ( valid_to) ;

CREATE  INDEX order_status_idx5
 ON order_status
  ( created) ;

CREATE  INDEX order_status_idx6
 ON order_status
  ( created_by) ;

CREATE  INDEX order_status_idx7
 ON order_status
  ( order_status) ;



/* ORDER_STATUS_TYPE tabeli indeksid ja piirangud */


/* ORDER_TYPE tabeli indeksid ja piirangud */



/* ORDER_STATUS_CLASS tabeli indeksid ja piirangud */



/* ORDER_RELATION tabeli indeksid ja piirangud */



CREATE  INDEX order_relation_idx1
 ON order_relation
  ( order_) ;

CREATE  INDEX order_relation_idx2
 ON order_relation
  ( order1) ;


CREATE  INDEX order_relation_idx3
 ON order_relation
  ( order_relation_type) ;


CREATE  INDEX order_relation_idx4
 ON order_relation
  ( order_relation) ;


/* ORDER_RELATION_TYPE tabeli indeksid ja piirangud */



/* PAYMENT_TYPE tabeli indeksid ja piirangud */


/* PAYM_GRAPH tabeli indeksid ja piirangud */


CREATE  INDEX paym_graph_idx1
 ON paym_graph
  ( order_) ;

CREATE  INDEX paym_graph_idx2
 ON paym_graph
  ( customer) ;

CREATE  INDEX paym_graph_idx3
 ON paym_graph
  (payment_type) ;

CREATE  INDEX paym_graph_idx4
 ON paym_graph
  (due_date) ;

CREATE  INDEX paym_graph_idx5
 ON paym_graph
  (contract) ;

CREATE  INDEX paym_graph_idx6
 ON paym_graph
  (status) ;

CREATE  INDEX paym_graph_idx7
 ON paym_graph
  (paym_graph) ;



/* PAYM_PART tabeli indeksid ja piirangud */



CREATE  INDEX paym_part_idx1
 ON paym_part
  (paym_graph) ;

CREATE  INDEX paym_part_idx2
 ON paym_part
  (paym_part_type) ;

CREATE  INDEX paym_part_idx3
 ON paym_part
  (paym_part) ;


/* PAYM_PART_TYPE tabeli indeksid ja piirangud */



/* CONTRACT_ATR_TYPE_VALUE tabeli indeksid ja piirangud */



CREATE  INDEX contract_atr_type_value_idx1
 ON contract_atr_type_value
  (contract_atr_type) ;

CREATE  INDEX contract_atr_type_value_idx2
 ON contract_atr_type_value
  (value_text varchar_pattern_ops) ;


CREATE  INDEX contract_atr_type_value_idx3
 ON contract_atr_type_value
  (contract_atr_type_value) ;




/* CONTRACT_TYPE_ATRIB tabeli indeksid ja piirangud */


CREATE  INDEX contract_type_atrib_idx1
 ON contract_type_atrib
  (contract_type) ;


CREATE  INDEX contract_type_atrib_idx2
 ON contract_type_atrib
  (contract_atr_type) ;

CREATE  INDEX contract_type_atrib_idx3
 ON contract_type_atrib
  (contract_type_atrib) ;


/* EMPLOYEE tabeli indeksid ja piirangud */



CREATE  INDEX employee_idx1
 ON employee
  (current_struct_unit) ;


CREATE  INDEX employee_idx2
 ON employee
  (first_name varchar_pattern_ops) ;

CREATE  INDEX employee_idx3
 ON employee
  (last_name varchar_pattern_ops) ;

CREATE  INDEX employee_idx4
 ON employee
  (emp_role) ;

CREATE  INDEX employee_idx5
 ON employee
  (employee) ;



/* EMP_USER tabeli indeksid ja piirangud */


CREATE UNIQUE INDEX emp_user_ux1 ON emp_user
  (
    username   varchar_pattern_ops                     
  );


CREATE  INDEX emp_user_idx1
 ON emp_user
  (employee) ;

CREATE  INDEX emp_user_idx2
 ON emp_user
  (passw varchar_pattern_ops) ;

CREATE  INDEX emp_user_idx3
 ON emp_user
  (emp_user) ;


/* EMP_ROLE tabeli indeksid ja piirangud */




/* EMP_APP_SESSION tabeli indeksid ja piirangud */


CREATE  INDEX emp_app_session_idx1
 ON emp_app_session
  (emp_user) ;


CREATE  INDEX emp_app_session_idx2
 ON emp_app_session
  (employee) ;

CREATE  INDEX emp_app_session_idx3
 ON emp_app_session
  (emp_app_session) ;



/* PRODUCT tabeli indeksid ja piirangud */


CREATE  INDEX product_idx1
 ON product
  ( product  ) ;

CREATE  INDEX product_idx2
 ON product
  (name varchar_pattern_ops) ;

CREATE  INDEX product_idx3
 ON product
  (catalog) ;

CREATE  INDEX product_idx4
 ON product
  (created) ;

CREATE  INDEX product_idx5
 ON product
  (updated) ;

CREATE  INDEX product_idx6
 ON product
  (description varchar_pattern_ops) ;

CREATE  INDEX product_idx7
 ON product
  (enterprise) ;

CREATE  INDEX product_idx8
 ON product
  (producer varchar_pattern_ops) ;

CREATE  INDEX product_idx9
 ON product
  (code varchar_pattern_ops) ;


CREATE  INDEX product_idx10
 ON product
  (price) ;



/* PRODUCT_CATALOG tabeli indeksid ja piirangud */


CREATE  INDEX product_catalog_idx1
 ON product_catalog
  ( product_catalog  ) ;

CREATE  INDEX product_catalog_idx2
 ON product_catalog
  ( struct_unit ) ;

CREATE  INDEX product_catalog_idx3
 ON product_catalog
  ( name varchar_pattern_ops) ;

CREATE  INDEX product_catalog_idx4
 ON product_catalog
  ( description varchar_pattern_ops) ;

CREATE  INDEX product_catalog_idx5
 ON product_catalog
  ( upper_catalog) ;


/* PRODUCT_PRODUCT_CATALOG tabeli indeksid ja piirangud */



CREATE  UNIQUE INDEX product_product_catalog_ux1
 ON product_product_catalog
  ( product, product_catalog  );

CREATE   INDEX product_product_catalog_idx1
 ON product_product_catalog
  ( product  );



CREATE   INDEX product_product_catalog_idx2
 ON product_product_catalog
  ( product_catalog  );


CREATE   INDEX product_product_catalog_idx3
 ON product_product_catalog
  ( product_product_catalog  );



/* PRODUCT_CATALOG_RELATION tabeli indeksid ja piirangud */



CREATE  UNIQUE INDEX product_catalog_relation_ux1
 ON product_catalog_relation
  ( upper_catalog, lower_catalog  );

CREATE   INDEX product_catalog_relation_idx1
 ON product_catalog_relation
  ( upper_catalog  );

CREATE   INDEX product_catalog_relation_idx2
 ON product_catalog_relation
  ( lower_catalog  );

CREATE   INDEX product_catalog_relation_idx3
 ON product_catalog_relation
  ( product_catalog_relation  );


/* PRODUCT_CATALOG_ATR_TYPE tabeli indeksid ja piirangud */



CREATE   INDEX product_catalog_atr_type_idx1
 ON product_catalog_atr_type
  ( product_catalog  );

CREATE   INDEX product_catalog_atr_type_idx2
 ON product_catalog_atr_type
  ( product_atr_type  );


CREATE   INDEX product_catalog_atr_type_idx3
 ON product_catalog_atr_type
  ( product_catalog_atr_type  );



/* PRODUCT_ATR_TYPE tabeli indeksid ja piirangud */




/* PRODUCT_ATTRIBUTE tabeli indeksid ja piirangud */



CREATE   INDEX product_attribute_idx1
 ON product_attribute
  ( product  );

CREATE   INDEX product_attribute_idx2
 ON product_attribute
  ( product_atr_type_value  );

CREATE   INDEX product_attribute_idx3
 ON product_attribute
  ( product_atr_type  );

CREATE   INDEX product_attribute_idx4
 ON product_attribute
  ( value_text varchar_pattern_ops);

CREATE   INDEX product_attribute_idx5
 ON product_attribute
  ( product_attribute);


/* PRODUCT_ATR_TYPE_VALUE tabeli indeksid ja piirangud */



CREATE   INDEX product_atr_type_value_idx1
 ON product_atr_type_value
  ( product_atr_type );


CREATE   INDEX product_atr_type_value_idx2
 ON product_atr_type_value
  ( value_text varchar_pattern_ops);

CREATE   INDEX product_atr_type_value_idx3
 ON product_atr_type_value
  ( product_atr_type_value );

/* CUSTOMER_ATTRIBUTE tabeli indeksid ja piirangud */



CREATE   INDEX customer_attribute_idx1
 ON customer_attribute
  ( customer );

CREATE   INDEX customer_attribute_idx2
 ON customer_attribute
  ( customer_atr_type);


CREATE   INDEX customer_attribute_idx3
 ON customer_attribute
  ( customer_atr_type_value);


CREATE   INDEX customer_attribute_idx4
 ON customer_attribute
  ( value_text varchar_pattern_ops);

CREATE   INDEX customer_attribute_idx5
 ON customer_attribute
  ( customer_attribute);


/* CUSTOMER_ATR_TYPE tabeli indeksid ja piirangud */



/* CST_TYPE_ATR_TYPE tabeli indeksid ja piirangud */



CREATE   INDEX cst_type_atr_type_idx1
 ON cst_type_atr_type
  ( customer_atr_type);

CREATE   INDEX cst_type_atr_type_idx2
 ON cst_type_atr_type
  ( cst_type);

CREATE   INDEX cst_type_atr_type_idx3
 ON cst_type_atr_type
  ( cst_type_atr_type);


/* CUSTOMER_ATR_TYPE_VALUE tabeli indeksid ja piirangud */


CREATE   INDEX customer_atr_type_value_idx1
 ON customer_atr_type_value
  ( customer_atr_type);

CREATE   INDEX customer_atr_type_value_idx2
 ON customer_atr_type_value
  ( value_text varchar_pattern_ops);

CREATE   INDEX customer_atr_type_value_idx3
 ON customer_atr_type_value
  ( customer_atr_type_value);


/* ENTERPRISE_CUSTOMER tabeli indeksid ja piirangud */



CREATE   INDEX enteprise_customer_idx1
 ON enterprise_customer
  ( enterprise);

CREATE   INDEX enteprise_customer_idx2
 ON enterprise_customer
  ( customer);

CREATE   INDEX enteprise_customer_idx3
 ON enterprise_customer
  ( customer, enterprise,relation_type);

CREATE   INDEX enteprise_customer_idx4
 ON enterprise_customer
  ( enterprise_customer);


/* ENTERPRISE tabeli indeksid ja piirangud */


CREATE   INDEX enteprise_idx1
 ON enterprise
  ( short_name varchar_pattern_ops);


CREATE   INDEX enteprise_idx2
 ON enterprise
  ( long_name varchar_pattern_ops);

CREATE   INDEX enteprise_idx3
 ON enterprise
  ( identity_code varchar_pattern_ops);


CREATE   INDEX enteprise_idx4
 ON enterprise
  ( enterprise);



/* ENT_TYPE tabeli indeksid ja piirangud */




/* ENT_RELATION tabeli indeksid ja piirangud */



CREATE   INDEX ent_relation_idx1
 ON ent_relation
  ( enterprise);

CREATE   INDEX ent_relation_idx2
 ON ent_relation
  ( enterprise1);

CREATE   INDEX ent_relation_idx3
 ON ent_relation
  ( enterprise, ent_relation_type);


CREATE   INDEX ent_relation_idx4
 ON ent_relation
  ( ent_relation);


/* ENT_RELATION_TYPE tabeli indeksid ja piirangud */



/* ENT_ADDRESS tabeli indeksid ja piirangud */



CREATE   INDEX ent_address_idx1
 ON ent_address
  ( enterprise);

CREATE   INDEX ent_address_idx2
 ON ent_address
  ( zip varchar_pattern_ops);

CREATE   INDEX ent_address_idx3
 ON ent_address
  ( house varchar_pattern_ops);

CREATE   INDEX ent_address_idx4
 ON ent_address
  ( address varchar_pattern_ops);

CREATE   INDEX ent_address_idx5
 ON ent_address
  ( county varchar_pattern_ops);

CREATE   INDEX ent_address_idx6
 ON ent_address
  ( town_county varchar_pattern_ops);

CREATE   INDEX ent_address_idx7
 ON ent_address
  ( country );

CREATE   INDEX ent_address_idx8
 ON ent_address
  ( ent_address);


/* CUSTOMER_MESSAGE tabeli indeksid ja piirangud */


CREATE   INDEX customer_message_idx1
 ON customer_message
  ( customer);

CREATE   INDEX customer_message_idx2
 ON customer_message
  ( created);

CREATE   INDEX customer_message_idx3
 ON customer_message
  ( cust_message_type);

CREATE   INDEX customer_message_idx4
 ON customer_message
  ( created_by);


CREATE   INDEX customer_message_idx5
 ON customer_message
  ( customer_message );

CREATE   INDEX customer_message_idx6
 ON customer_message
  ( value_text varchar_pattern_ops);


CREATE   INDEX customer_message_idx7
 ON customer_message
  ( subject varchar_pattern_ops);


/* CUST_MESSAGE_TYPE tabeli indeksid ja piirangud */



/* CUST_MESSAGE_STATUS_TYPE tabeli indeksid ja piirangud */


/* CUST_EVENT_CLASS tabeli indeksid ja piirangud */



/* CUST_EVENT_TYPE tabeli indeksid ja piirangud */



/* CUSTOMER_EVENT tabeli indeksid ja piirangud */



CREATE   INDEX customer_event_idx1
 ON customer_event
  ( customer);

CREATE   INDEX customer_event_idx2
 ON customer_event
  ( created_by);

CREATE   INDEX customer_event_idx3
 ON customer_event
  ( cust_event_type);


CREATE   INDEX customer_event_idx4
 ON customer_event
  ( struct_unit);


CREATE   INDEX customer_event_idx5
 ON customer_event
  ( project);

CREATE   INDEX customer_event_idx6
 ON customer_event
  ( subject varchar_pattern_ops);

CREATE   INDEX customer_event_idx7
 ON customer_event
  ( created);


CREATE   INDEX customer_event_idx8
 ON customer_event
  ( customer_event);

CREATE   INDEX customer_event_idx9
 ON customer_event
  ( value_text varchar_pattern_ops);

/* CUST_EVENT_ATRIB_TYPE tabeli indeksid ja piirangud */



/* CUST_EVENT_ATRIB_VALUE tabeli indeksid ja piirangud */



/* CUST_EVENT_ATRIB tabeli indeksid ja piirangud */



CREATE   INDEX cust_event_atrib_idx1
 ON cust_event_atrib
  ( customer_event);

CREATE   INDEX cust_event_atrib_idx2
 ON cust_event_atrib
  ( cust_event_atrib_value);


CREATE   INDEX cust_event_atrib_idx3
 ON cust_event_atrib
  ( cust_event_atrib_type);

CREATE   INDEX cust_event_atrib_idx4
 ON cust_event_atrib
  ( value_text varchar_pattern_ops);

CREATE   INDEX cust_event_atrib_idx5
 ON cust_event_atrib
  ( cust_event_atrib );



/* PROJECT_TYPE tabeli indeksid ja piirangud */



/* PROJECT tabeli indeksid ja piirangud */



CREATE   INDEX project_idx1
 ON project
  ( name varchar_pattern_ops);

CREATE   INDEX project_idx2
 ON project
  ( struct_unit);

CREATE   INDEX project_idx3
 ON project
  ( manager);

CREATE   INDEX project_idx4
 ON project
  ( project);


/* PROJECT_STATUS tabeli indeksid ja piirangud */

CREATE   INDEX project_status_idx1
 ON project_status
  ( project);

CREATE   INDEX project_status_idx2
 ON project_status
  ( project_status_type);

CREATE   INDEX project_status_idx3
 ON project_status
  ( status_start);

CREATE   INDEX project_status_idx4
 ON project_status
  ( status_end);

CREATE   INDEX project_status_idx5
 ON project_status
  ( project_status);

/* PROJECT_STATUS_TYPE tabeli indeksid ja piirangud */




/* PROJECT_RELATION_TYPE tabeli indeksid ja piirangud */




/* PROJECT_RELATION tabeli indeksid ja piirangud */




CREATE   INDEX project_relation_idx1
 ON project_relation
  ( project);


CREATE   INDEX project_relation_idx2
 ON project_relation
  ( project1);

CREATE   INDEX project_relation_idx3
 ON project_relation
  ( project, relation_type);


CREATE   INDEX project_relation_idx4
 ON project_relation
  ( project_relation);


/* PROPERTY_TYPE tabeli indeksid ja piirangud */




/* PROPERTY tabeli indeksid ja piirangud */


CREATE   INDEX property_idx1
 ON property
  ( property_type);

CREATE   INDEX property_idx2
 ON property
  ( name varchar_pattern_ops);

CREATE   INDEX property_idx3
 ON property
  ( created);

CREATE   INDEX property_idx4
 ON property
  ( updated);

CREATE   INDEX property_idx5
 ON property
  ( created_by);


CREATE   INDEX property_idx6
 ON property
  ( updated_by);


CREATE   INDEX property_idx7
 ON property
  ( property);

CREATE   INDEX property_idx8
 ON property
  ( description varchar_pattern_ops);

CREATE   INDEX property_idx9
 ON property
  ( note varchar_pattern_ops);


/* PROPERTY_CLASS tabeli indeksid ja piirangud */



/* PROPERTY_RELATION tabeli indeksid ja piirangud */


CREATE   INDEX property_relation_idx1
 ON property_relation
  ( property);

CREATE   INDEX property_relation_idx2
 ON property_relation
  ( property1);

CREATE   INDEX property_relation_idx3
 ON property_relation
  ( property, relation_type);

CREATE   INDEX property_relation_idx4
 ON property_relation
  (property_relation);

/* PROPERTY_STATUS tabeli indeksid ja piirangud */



CREATE   INDEX property_status_idx1
 ON property_status
  ( property);


CREATE   INDEX property_status_idx2
 ON property_status
  ( property_status_type);

CREATE   INDEX property_status_idx3
 ON property_status
  ( status_start);

CREATE   INDEX property_status_idx4
 ON property_status
  ( status_end);

CREATE   INDEX property_status_idx5
 ON property_status
  (created);

CREATE   INDEX property_status_idx6
 ON property_status
  (property_status);



/* PROPERTY_STATUS_TYPE tabeli indeksid ja piirangud */





/* PROPERTY_ATTRIBUTE tabeli indeksid ja piirangud */



CREATE   INDEX property_attribute_idx1
 ON property_attribute
  (property);

CREATE   INDEX property_attribute_idx2
 ON property_attribute
  (property_atr_value);

CREATE   INDEX property_attribute_idx3
 ON property_attribute
  (property_atr_type);

CREATE   INDEX property_attribute_idx4
 ON property_attribute
  (value_text varchar_pattern_ops);


CREATE   INDEX property_attribute_idx5
 ON property_attribute
  (property_attribute);

/* PROPERTY_ATR_TYPE tabeli indeksid ja piirangud */



/* PROP_TYPE_ATRIB tabeli indeksid ja piirangud */



CREATE   INDEX prop_type_atrib_idx1
 ON prop_type_atrib
  (property_atr_type);

CREATE   INDEX prop_type_atrib_idx2
 ON prop_type_atrib
  (property_type);

CREATE   INDEX prop_type_atrib_idx3
 ON prop_type_atrib
  (prop_type_atrib);




/* PROPERTY_ATR_VALUE tabeli indeksid ja piirangud */


CREATE   INDEX property_atr_value_idx1
 ON property_atr_value
  (property_atr_type);

CREATE   INDEX property_atr_value_idx2
 ON property_atr_value
  (value_text varchar_pattern_ops);

CREATE   INDEX property_atr_value_idx3
 ON property_atr_value
  (property_atr_value);



/* CONTRACT_PROPERTY tabeli indeksid ja piirangud */




CREATE   INDEX contract_property_idx1
 ON contract_property
  (contract);

CREATE   INDEX contract_property_idx2
 ON contract_property
  (property);

CREATE   INDEX contract_property_idx3
 ON contract_property
  (relation_type);

CREATE   INDEX contract_property_idx4
 ON contract_property
  (contract_property);


/* CATALOG_TYPE tabeli indeksid ja piirangud */



/* ENT_CUSTOMER_RELATION_TYPE tabeli indeksid ja piirangud */






