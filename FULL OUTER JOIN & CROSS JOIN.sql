CREATE DATABASE DANISH_DATABASE;
USE DATABASE DANISH_DATABASE;

----------------------------------------------------------------------------FULL OUTER JOIN----------------------------------------------------------------------------------------------------
CREATE OR REPLACE TABLE DM_LOAN
                               (LOAN_NO INT PRIMARY KEY,
                               LOAN_STATUS VARCHAR (20),
                               STATE VARCHAR (30),
                               LOAN_AMOUNT NUMBER(8,2),
                               AP_DATE DATE);
                               
CREATE OR REPLACE TABLE DM_BORROWER
                               (LOAN_NO INT FOREIGN KEY REFERENCES DM_LOAN(LOAN_NO),
                               BORROWER_NAME VARCHAR (30),
                               BORROWER_DATE DATE,
                               BANK_ID VARCHAR (5));


INSERT INTO DM_LOAN VALUES (12, 'Open', 'Ranchi', 30000, '2015-02-01'),
                           (23, 'Close', 'Patna', 50000, '2017-04-03'),
                           (31, 'Pending', 'Kolkata', 80000, '2018-07-09'),
                           (43, 'Approval', 'Mumbai', 54000, '2019-11-10'),
                           (11, 'Rejected', 'Banglore', 43000, '2017-04-03'),
                           (33, 'Close', 'Patna', 9000, '2018-07-09'),
                           (44, 'Open', 'Kolkata', 67000, '2020-01-01');

INSERT INTO DM_BORROWER VALUES (12, 'Ram', '2014-07-09', 'A1'),
                               (27, 'Sundar', '2016-06-19', 'A2'),
                               (43, 'Browny', '2019-07-16', 'A4'),
                               (31, 'Blacky', '2015-07-09', 'A2');

SELECT * FROM DM_LOAN;
SELECT * FROM DM_BORROWER;

SELECT L.LOAN_NO, L.LOAN_STATUS, B.BORROWER_NAME, B.BORROWER_DATE, L.STATE, L.LOAN_AMOUNT
FROM DM_LOAN L
FULL OUTER JOIN DM_BORROWER B ON L.LOAN_NO=B.LOAN_NO
--WHERE B.BORROWER_DATE IS NOT NULL AND L.LOAN_NO IS NOT NULL
ORDER BY L.LOAN_NO;

--------------------------------------------------------------------------------CROSS JOIN-----------------------------------------------------------------------------------------------------


CREATE TABLE DM_Meals(MealName VARCHAR(100));

CREATE TABLE DM_Drinks(DrinkName VARCHAR(100));

INSERT INTO DM_Drinks
VALUES('Orange Juice'), ('Tea'), ('Cofee'),('Beer');

INSERT INTO DM_Meals
VALUES('Omlet'), ('Fried Egg'), ('Sausage');

SELECT * FROM DM_Drinks;
SELECT * FROM DM_Meals;

SELECT * FROM DM_Meals
CROSS JOIN DM_Drinks;

--OR--

SELECT * FROM DM_Meals , DM_Drinks;

--WHEN YOU WANTS TO CONCAT

SELECT *, MealName || ' ' || DrinkName AS MENU_LIST
FROM DM_Meals CROSS JOIN DM_Drinks;


SELECT *, CONCAT_WS('-',MealName,DrinkName) AS MenuList
FROM DM_Meals 
CROSS JOIN DM_Drinks;

