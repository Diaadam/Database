CREATE TABLE BRANCH
(
    branch_id	    VarChar2(6),
    address	        VarChar2(50) NOT NULL,
    contact_info	VarChar2(100),
    CONSTRAINT pk_branch PRIMARY KEY (branch_id)
);
 
CREATE TABLE CUSTOMER
(
     ssn	    VARCHAR2(14),
    address	    VARCHAR2(50) NOT NULL ,
    email	    VARCHAR2(32),
    first_name	VARCHAR2(10) NOT NULL ,
    second_name	VARCHAR2(10) NOT NULL ,
    last_name	VARCHAR2(10) NOT NULL ,
    Branch_id	VARCHAR2(6),

    CONSTRAINT pk_CUSTOMER PRIMARY KEY (ssn),
    CONSTRAINT fk_BRANCH_CUSTOMER FOREIGN KEY (Branch_id) REFERENCES BRANCH (branch_id)

);

CREATE TABLE ACCOUNT
(
    account_id	    VARCHAR2(10),
    balance	        NUMERIC (15, 6) NOT NULL,
    interest_rate	NUMERIC (7, 5) NOT NULL,
    account_type	VARCHAR2(10) NOT NULL,
    open_date    	DATE NOT NULL,
    ssn         	VARCHAR2(14),
    CONSTRAINT pk_ACCOUNT PRIMARY KEY (account_id),
    CONSTRAINT fk_ACCOUNT_CUSTOMER FOREIGN KEY (ssn) REFERENCES CUSTOMER (ssn)
);

CREATE TABLE CUSTOMER_PHONE
(
    ssn	    VARCHAR2(14),
    phone	NUMERIC (13, 0),
    CONSTRAINT pk_CUSTOMER_PHONE PRIMARY KEY (phone,ssn),
    CONSTRAINT fk_CUSTOMER_PHONE_CUSTOMER FOREIGN KEY (ssn) REFERENCES CUSTOMER (ssn)
);

CREATE TABLE DEBIT_CARD
(
    card_id	VARCHAR2(16),
    Card_type	VARCHAR2(10) NOT NULL,
    Cardholder_name	VARCHAR2(20) NOT NULL,
    cvv	VARCHAR2(4) NOT NULL,
    expiry_date	DATE NOT NULL,
    pin	VARCHAR2(4) NOT NULL UNIQUE,
    account_id	VARCHAR2(10),

    CONSTRAINT pk_DEBIT_CARD PRIMARY KEY (card_id),
    CONSTRAINT fk_DEBIT_CARD_CUSTOMER FOREIGN KEY (account_id) REFERENCES ACCOUNT (account_id)
);

CREATE TABLE TRANSACTION
(
    Transaction_id	    VARCHAR2(10),
    Transaction_type	VARCHAR2(1) NOT NULL,
    Date_of_transaction	DATE NOT NULL,
    amount	            NUMERIC (9, 2) NOT NULL,
    ssn             	VARCHAR2(14),
    account_id	        VARCHAR2(10),


    CONSTRAINT pk_TRANSACTION PRIMARY KEY (Transaction_id),
    CONSTRAINT fk_TRANSACTION_CUSTOMER FOREIGN KEY (ssn) REFERENCES CUSTOMER (ssn),
    CONSTRAINT fk_TRANSACTION_ACCOUNT FOREIGN KEY (account_id) REFERENCES ACCOUNT (account_id)
);

CREATE TABLE LOAN
(
Loan_id	            VARCHAR2(10),
Remaining_amount	NUMERIC(15,5),
Interest_amount	    NUMERIC (7, 5),
Outstanding_balance	NUMERIC(15,5),
Principle_amount	NUMERIC(15,5),
Loan_type	VARCHAR2(10),
account_id	VARCHAR2(10),

    CONSTRAINT pk_LOAN PRIMARY KEY (Loan_id),
    CONSTRAINT fk_LOAN_ACCOUNT FOREIGN KEY (account_id) REFERENCES ACCOUNT (account_id)
);

CREATE TABLE LOAN_PAYMENT
(
    Payment_id  	VARCHAR2(10),
    Payment_amount	NUMERIC(15,5) NOT NULL,
    Loan_id	        VARCHAR2(10),
    Payment_method	VARCHAR2(10)NOT NULL,

    CONSTRAINT pk_LOAN_PAYMENT PRIMARY KEY (Payment_id),
    CONSTRAINT fk_LOAN_PAYMENT_LOAN FOREIGN KEY (Loan_id) REFERENCES LOAN (Loan_id)
);

CREATE TABLE ATM
(
    atm_id	        VARCHAR2(10),
    atm_location	VARCHAR2(50) NOT NULL,
    atm_status  	VARCHAR2(10) NOT NULL,
    atm_branch_id	VARCHAR2(6),

    CONSTRAINT pk_ATM PRIMARY KEY (atm_id),
    CONSTRAINT fk_ATM_BRANCH FOREIGN KEY (atm_branch_id) REFERENCES BRANCH (branch_id)
);

CREATE TABLE EMPLOYEE
(
    emp_id  	    VARCHAR2(10),
    emp_address	    VARCHAR2(50) NOT NULL,
    emp_phone	    VARCHAR2(13) NOT NULL,
    emp_email	    VARCHAR2(32),
    emp_first_name	VARCHAR2(10) NOT NULL,
    emp_last_name	VARCHAR2(10) NOT NULL,
    emp_salary  	NUMERIC(7)   NOT NULL,
    emp_branch_id  	VARCHAR2(10),


    CONSTRAINT pk_EMPLOYEE PRIMARY KEY (emp_id),
    CONSTRAINT fk_EMPLOYEE_BRANCH FOREIGN KEY (emp_branch_id) REFERENCES BRANCH (branch_id)
);
