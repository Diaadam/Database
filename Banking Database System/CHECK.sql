INSERT INTO BRANCH (branch_id, address, contact_info)
VALUES ('001', '1 Main St', '123-456-7890');

INSERT INTO BRANCH (branch_id, address, contact_info)
VALUES ('002', '2 Main St', '123-456-7890');
SELECT * FROM BRANCH;
/************************/
INSERT INTO CUSTOMER (ssn, address, email, first_name, second_name, last_name, branch_id)
VALUES ('123456789', '4 Elm St', 'john.doe@example.com', 'John', 'Middle', 'Doe', '001');

INSERT INTO CUSTOMER(ssn, address, email, first_name, second_name, last_name, branch_id)
VALUES('12345678', '4 Elm St', 'john.doe@example.com', 'Juan', 'Middle', 'Doe', '002');
SELECT * FROM CUSTOMER;
/***************************/
INSERT INTO ACCOUNT (account_id, balance, interest_rate, account_type, open_date, ssn)
VALUES ('001', 10000.00, 0.05, 'Savings', TO_DATE('2022-04-25', 'YYYY-MM-DD'), '123456789');

INSERT INTO ACCOUNT (account_id, balance, interest_rate, account_type, open_date, ssn)
VALUES ('002', 10000.00, 0.05, 'Savings', TO_DATE('2022-05-25', 'YYYY-MM-DD'), '12345678');
SELECT * FROM ACCOUNT;
/*******************************************************************/
INSERT INTO CUSTOMER_PHONE (ssn, phone)
VALUES ('123456789', 1234567890);
SELECT * FROM CUSTOMER_PHONE;
/*************************************/
INSERT INTO DEBIT_CARD (card_id, Card_type, Cardholder_name, cvv, expiry_date, pin, account_id)
VALUES ('001', 'Debit', 'John Doe', '123', TO_DATE('2023-12-31', 'YYYY-MM-DD'), '1234', '001');
SELECT * FROM DEBIT_CARD;
/******************************************/
INSERT INTO TRANSACTION (Transaction_id, Transaction_type, Date_of_transaction, amount, ssn, account_id)
VALUES ('001', '1', TO_DATE('2022-04-30', 'YYYY-MM-DD'), 500.00, '123456789', '001');
SELECT * FROM TRANSACTION;
/*****************************/
INSERT INTO LOAN (Loan_id, Remaining_amount, Interest_amount, Outstanding_balance, Starting_date, Loan_type, account_id)
VALUES ('001', 100000.00, 0.05, 95000.00, TO_DATE('2022-05-01', 'YYYY-MM-DD'), 'Home Loan', '001');
SELECT * FROM LOAN;
/*********************************/
INSERT INTO LOAN_PAYMENT (Payment_id, Payment_amount, Loan_id, Payment_method)
VALUES ('001', 1000.00, '001', 'Online');
SELECT * FROM LOAN_PAYMENT;
/*******************************/
INSERT INTO ATM (atm_id, atm_location, atm_status, atm_branch_id)
VALUES ('001', 'Main St', 'on', '001');
SELECT * FROM ATM;
/*******************************/
INSERT INTO EMPLOYEE (emp_id, emp_address, emp_phone, emp_email, emp_first_name, emp_last_name, emp_salary, emp_branch_id)
VALUES ('001', '78 Oak Ave', '9876543210', 'jane.smith@example.com', 'Jane', 'Smith', 50000.00, '001');
SELECT * FROM EMPLOYEE;
/*******************************/
