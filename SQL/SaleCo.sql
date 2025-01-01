/* Introduction to SQL 					*/
/* Script file for MySQL DBMS			*/
/* This script file creates the following tables:	*/
/* VENDOR, PRODUCT, CUSTOMER, INVOICE, LINE		*/
/* EMPLOYEE, EMP					*/
/* and loads the default data rows			*/

DROP DATABASE IF EXISTS SALECO;

CREATE DATABASE SALECO;

USE SALECO;

CREATE TABLE VENDOR (
    V_CODE INTEGER,
    V_NAME VARCHAR(35) NOT NULL,
    V_CONTACT VARCHAR(15) NOT NULL,
    V_AREACODE CHAR(3) NOT NULL,
    V_PHONE CHAR(8) NOT NULL,
    V_STATE CHAR(2) NOT NULL,
    V_ORDER CHAR(1) NOT NULL,
    PRIMARY KEY (V_CODE)
);

CREATE TABLE PRODUCT (
    P_CODE VARCHAR(10) PRIMARY KEY,
    P_DESCRIPT VARCHAR(35) NOT NULL,
    P_INDATE DATETIME NOT NULL,
    P_QOH INTEGER NOT NULL,
    P_MIN INTEGER NOT NULL,
    P_PRICE NUMERIC(8, 2) NOT NULL,
    P_DISCOUNT NUMERIC(4, 2) NOT NULL,
    V_CODE INTEGER,
    CONSTRAINT PRODUCT_V_CODE_FK FOREIGN KEY (V_CODE) REFERENCES VENDOR (V_CODE)
);

CREATE TABLE CUSTOMER (
    CUS_CODE INTEGER PRIMARY KEY,
    CUS_LNAME VARCHAR(15) NOT NULL,
    CUS_FNAME VARCHAR(15) NOT NULL,
    CUS_INITIAL CHAR(1),
    CUS_AREACODE CHAR(3),
    CUS_PHONE CHAR(8) NOT NULL,
    CUS_BALANCE NUMERIC(9, 2) DEFAULT 0.00,
    CONSTRAINT CUS_UI1 UNIQUE(CUS_LNAME, CUS_FNAME, CUS_PHONE)
);

CREATE TABLE INVOICE (
    INV_NUMBER INTEGER PRIMARY KEY,
    CUS_CODE INTEGER NOT NULL,
    INV_DATE DATETIME NOT NULL,
    CONSTRAINT INVOICE_CUS_CODE_FK FOREIGN KEY (CUS_CODE) REFERENCES CUSTOMER(CUS_CODE)
);

CREATE TABLE LINE (
    INV_NUMBER INTEGER NOT NULL,
    LINE_NUMBER NUMERIC(2, 0) NOT NULL,
    P_CODE VARCHAR(10) NOT NULL,
    LINE_UNITS NUMERIC(9, 2) DEFAULT 0.00 NOT NULL,
    LINE_PRICE NUMERIC(9, 2) DEFAULT 0.00 NOT NULL,
    PRIMARY KEY (INV_NUMBER, LINE_NUMBER),
    FOREIGN KEY (INV_NUMBER) REFERENCES INVOICE (INV_NUMBER) ON DELETE CASCADE,
    FOREIGN KEY (P_CODE) REFERENCES PRODUCT(P_CODE),
    CONSTRAINT LINE_UI1 UNIQUE(INV_NUMBER, P_CODE)
);

CREATE TABLE EMPLOYEE (
    EMP_NUM INTEGER PRIMARY KEY,
    EMP_TITLE CHAR(10),
    EMP_LNAME VARCHAR(15) NOT NULL,
    EMP_FNAME VARCHAR(15) NOT NULL,
    EMP_INITIAL CHAR(1),
    EMP_DOB DATETIME,
    EMP_HIRE_DATE DATETIME,
    EMP_YEARS INTEGER,
    EMP_AREACODE CHAR(3),
    EMP_PHONE CHAR(8)
);

CREATE TABLE EMP (
    EMP_NUM INTEGER PRIMARY KEY,
    EMP_TITLE CHAR(10),
    EMP_LNAME VARCHAR(15) NOT NULL,
    EMP_FNAME VARCHAR(15) NOT NULL,
    EMP_INITIAL CHAR(1),
    EMP_DOB DATETIME,
    EMP_HIRE_DATE DATETIME,
    EMP_AREACODE CHAR(3),
    EMP_PHONE CHAR(8),
    EMP_MGR INTEGER
);

/* Loading data rows					*/


/* VENDOR rows						*/
INSERT INTO VENDOR VALUES(
    21225,
    'Bryson, Inc.',
    'Smithson',
    '615',
    '223-3234',
    'TN',
    'Y'
);

INSERT INTO VENDOR VALUES(
    21226,
    'SuperLoo, Inc.',
    'Flushing',
    '904',
    '215-8995',
    'FL',
    'N'
);

INSERT INTO VENDOR VALUES(
    21231,
    'D&E Supply',
    'Singh',
    '615',
    '228-3245',
    'TN',
    'Y'
);

INSERT INTO VENDOR VALUES(
    21344,
    'Gomez Bros.',
    'Ortega',
    '615',
    '889-2546',
    'KY',
    'N'
);

INSERT INTO VENDOR VALUES(
    22567,
    'Dome Supply',
    'Smith',
    '901',
    '678-1419',
    'GA',
    'N'
);

INSERT INTO VENDOR VALUES(
    23119,
    'Randsets Ltd.',
    'Anderson',
    '901',
    '678-3998',
    'GA',
    'Y'
);

INSERT INTO VENDOR VALUES(
    24004,
    'Brackman Bros.',
    'Browning',
    '615',
    '228-1410',
    'TN',
    'N'
);

INSERT INTO VENDOR VALUES(
    24288,
    'ORDVA, Inc.',
    'Hakford',
    '615',
    '898-1234',
    'TN',
    'Y'
);

INSERT INTO VENDOR VALUES(
    25443,
    'B&K, Inc.',
    'Smith',
    '904',
    '227-0093',
    'FL',
    'N'
);

INSERT INTO VENDOR VALUES(
    25501,
    'Damal Supplies',
    'Smythe',
    '615',
    '890-3529',
    'TN',
    'N'
);

INSERT INTO VENDOR VALUES(
    25595,
    'Rubicon Systems',
    'Orton',
    '904',
    '456-0092',
    'FL',
    'Y'
);

/* PRODUCT rows						*/
INSERT INTO PRODUCT VALUES(
    '11QER/31',
    'Power painter, 15 psi., 3-nozzle',
    '2021-11-03',
    8,
    5,
    109.99,
    0.00,
    25595
);

INSERT INTO PRODUCT VALUES(
    '13-Q2/P2',
    '7.25-in. pwr. saw blade',
    '2021-12-13',
    32,
    15,
    14.99,
    0.05,
    21344
);

INSERT INTO PRODUCT VALUES(
    '14-Q1/L3',
    '9.00-in. pwr. saw blade',
    '2021-11-13',
    18,
    12,
    17.49,
    0.00,
    21344
);

INSERT INTO PRODUCT VALUES(
    '1546-QQ2',
    'Hrd. cloth, 1/4-in., 2x50',
    '2022-01-15',
    15,
    8,
    39.95,
    0.00,
    23119
);

INSERT INTO PRODUCT VALUES(
    '1558-QW1',
    'Hrd. cloth, 1/2-in., 3x50',
    '2022-01-15',
    23,
    5,
    43.99,
    0.00,
    23119
);

INSERT INTO PRODUCT VALUES(
    '2232/QTY',
    'B&D jigsaw, 12-in. blade',
    '2021-12-30',
    8,
    5,
    109.92,
    0.05,
    24288
);

INSERT INTO PRODUCT VALUES(
    '2232/QWE',
    'B&D jigsaw, 8-in. blade',
    '2021-12-24',
    6,
    5,
    99.87,
    0.05,
    24288
);

INSERT INTO PRODUCT VALUES(
    '2238/QPD',
    'B&D cordless drill, 1/2-in.',
    '2022-01-20',
    12,
    5,
    38.95,
    0.05,
    25595
);

INSERT INTO PRODUCT VALUES(
    '23109-HB',
    'Claw hammer',
    '2022-01-20',
    23,
    10,
    9.95,
    0.10,
    21225
);

INSERT INTO PRODUCT VALUES(
    '23114-AA',
    'Sledge hammer, 12 lb.',
    '2022-01-02',
    8,
    5,
    14.40,
    0.05,
    NULL
);

INSERT INTO PRODUCT VALUES(
    '54778-2T',
    'Rat-tail file, 1/8-in. fine',
    '2021-12-15',
    43,
    20,
    4.99,
    0.00,
    21344
);

INSERT INTO PRODUCT VALUES(
    '89-WRE-Q',
    'Hicut chain saw, 16 in.',
    '2022-02-07',
    11,
    5,
    256.99,
    0.05,
    24288
);

INSERT INTO PRODUCT VALUES(
    'PVC23DRT',
    'PVC pipe, 3.5-in., 8-ft',
    '2022-02-20',
    188,
    75,
    5.87,
    0.00,
    NULL
);

INSERT INTO PRODUCT VALUES(
    'SM-18277',
    '1.25-in. metal screw, 25',
    '2022-03-01',
    172,
    75,
    6.99,
    0.00,
    21225
);

INSERT INTO PRODUCT VALUES(
    'SW-23116',
    '2.5-in. wd. screw, 50',
    '2022-02-24',
    237,
    100,
    8.45,
    0.00,
    21231
);

INSERT INTO PRODUCT VALUES(
    'WR3/TT3',
    'Steel matting, 4''x8''x1/6", .5" mesh',
    '2022-01-17',
    18,
    5,
    119.95,
    0.10,
    25595
);

/* CUSTOMER rows					*/
INSERT INTO CUSTOMER VALUES(
    10010,
    'Ramas',
    'Alfred',
    'A',
    '615',
    '844-2573',
    0
);

INSERT INTO CUSTOMER VALUES(
    10011,
    'Dunne',
    'Leona',
    'K',
    '713',
    '894-1238',
    0
);

INSERT INTO CUSTOMER VALUES(
    10012,
    'Smith',
    'Kathy',
    'W',
    '615',
    '894-2285',
    345.86
);

INSERT INTO CUSTOMER VALUES(
    10013,
    'Olowski',
    'Paul',
    'F',
    '615',
    '894-2180',
    536.75
);

INSERT INTO CUSTOMER VALUES(
    10014,
    'Orlando',
    'Myron',
    NULL,
    '615',
    '222-1672',
    0
);

INSERT INTO CUSTOMER VALUES(
    10015,
    'O''Brian',
    'Amy',
    'B',
    '713',
    '442-3381',
    0
);

INSERT INTO CUSTOMER VALUES(
    10016,
    'Brown',
    'James',
    'G',
    '615',
    '297-1228',
    221.19
);

INSERT INTO CUSTOMER VALUES(
    10017,
    'Williams',
    'George',
    NULL,
    '615',
    '290-2556',
    768.93
);

INSERT INTO CUSTOMER VALUES(
    10018,
    'Farriss',
    'Anne',
    'G',
    '713',
    '382-7185',
    216.55
);

INSERT INTO CUSTOMER VALUES(
    10019,
    'Smith',
    'Olette',
    'K',
    '615',
    '297-3809',
    0
);

/* INVOICE rows						*/
INSERT INTO INVOICE VALUES(
    1001,
    10014,
    '2022-01-16'
);

INSERT INTO INVOICE VALUES(
    1002,
    10011,
    '2022-01-16'
);

INSERT INTO INVOICE VALUES(
    1003,
    10012,
    '2022-01-16'
);

INSERT INTO INVOICE VALUES(
    1004,
    10011,
    '2022-01-17'
);

INSERT INTO INVOICE VALUES(
    1005,
    10018,
    '2022-01-17'
);

INSERT INTO INVOICE VALUES(
    1006,
    10014,
    '2022-01-17'
);

INSERT INTO INVOICE VALUES(
    1007,
    10015,
    '2022-01-17'
);

INSERT INTO INVOICE VALUES(
    1008,
    10011,
    '2022-01-17'
);

/* LINE rows						*/
INSERT INTO LINE VALUES(
    1001,
    1,
    '13-Q2/P2',
    1,
    14.99
);

INSERT INTO LINE VALUES(
    1001,
    2,
    '23109-HB',
    1,
    9.95
);

INSERT INTO LINE VALUES(
    1002,
    1,
    '54778-2T',
    2,
    4.99
);

INSERT INTO LINE VALUES(
    1003,
    1,
    '2238/QPD',
    1,
    38.95
);

INSERT INTO LINE VALUES(
    1003,
    2,
    '1546-QQ2',
    1,
    39.95
);

INSERT INTO LINE VALUES(
    1003,
    3,
    '13-Q2/P2',
    5,
    14.99
);

INSERT INTO LINE VALUES(
    1004,
    1,
    '54778-2T',
    3,
    4.99
);

INSERT INTO LINE VALUES(
    1004,
    2,
    '23109-HB',
    2,
    9.95
);

INSERT INTO LINE VALUES(
    1005,
    1,
    'PVC23DRT',
    12,
    5.87
);

INSERT INTO LINE VALUES(
    1006,
    1,
    'SM-18277',
    3,
    6.99
);

INSERT INTO LINE VALUES(
    1006,
    2,
    '2232/QTY',
    1,
    109.92
);

INSERT INTO LINE VALUES(
    1006,
    3,
    '23109-HB',
    1,
    9.95
);

INSERT INTO LINE VALUES(
    1006,
    4,
    '89-WRE-Q',
    1,
    256.99
);

INSERT INTO LINE VALUES(
    1007,
    1,
    '13-Q2/P2',
    2,
    14.99
);

INSERT INTO LINE VALUES(
    1007,
    2,
    '54778-2T',
    1,
    4.99
);

INSERT INTO LINE VALUES(
    1008,
    1,
    'PVC23DRT',
    5,
    5.87
);

INSERT INTO LINE VALUES(
    1008,
    2,
    'WR3/TT3',
    3,
    119.95
);

INSERT INTO LINE VALUES(
    1008,
    3,
    '23109-HB',
    1,
    9.95
);

/* EMP rows						*/
INSERT INTO EMP VALUES(
    100,
    'Mr.',
    'Kolmycz',
    'George',
    'D',
    '1967-06-15',
    '2010-03-15',
    '615',
    '324-5456',
    NULL
);

INSERT INTO EMP VALUES(
    101,
    'Ms.',
    'Lewis',
    'Rhonda',
    'G',
    '1990-03-19',
    '2011-04-25',
    '615',
    '324-4472',
    100
);

INSERT INTO EMP VALUES(
    102,
    'Mr.',
    'Vandam',
    'Rhett',
    NULL,
    '1983-11-14',
    '2015-12-20',
    '901',
    '675-8993',
    100
);

INSERT INTO EMP VALUES(
    103,
    'Ms.',
    'Jones',
    'Anne',
    'M',
    '1999-10-16',
    '2019-08-28',
    '615',
    '898-3456',
    100
);

INSERT INTO EMP VALUES(
    104,
    'Mr.',
    'Lange',
    'John',
    'P',
    '1996-11-08',
    '2019-10-20',
    '901',
    '504-4430',
    105
);

INSERT INTO EMP VALUES(
    105,
    'Mr.',
    'Williams',
    'Robert',
    'D',
    '2000-03-14',
    '2020-11-08',
    '615',
    '890-3220',
    NULL
);

INSERT INTO EMP VALUES(
    106,
    'Mrs.',
    'Smith',
    'Jeanine',
    'K',
    '1993-02-12',
    '2014-01-05',
    '615',
    '324-7883',
    105
);

INSERT INTO EMP VALUES(
    107,
    'Mr.',
    'Diante',
    'Jorge',
    'D',
    '1999-08-21',
    '2019-07-02',
    '615',
    '890-4567',
    105
);

INSERT INTO EMP VALUES(
    108,
    'Mr.',
    'Wiesenbach',
    'Paul',
    'R',
    '1991-02-14',
    '2017-11-18',
    '615',
    '897-4358',
    NULL
);

INSERT INTO EMP VALUES(
    109,
    'Mr.',
    'Smith',
    'George',
    'K',
    '1986-06-18',
    '2014-04-14',
    '901',
    '504-3339',
    108
);

INSERT INTO EMP VALUES(
    110,
    'Mrs.',
    'Genkazi',
    'Leighla',
    'W',
    '1995-05-19',
    '2015-12-01',
    '901',
    '569-0093',
    108
);

INSERT INTO EMP VALUES(
    111,
    'Mr.',
    'Washington',
    'Rupert',
    'E',
    '1991-01-03',
    '2018-06-21',
    '615',
    '890-4925',
    105
);

INSERT INTO EMP VALUES(
    112,
    'Mr.',
    'Johnson',
    'Edward',
    'E',
    '1986-05-14',
    '2008-12-01',
    '615',
    '898-4387',
    100
);

INSERT INTO EMP VALUES(
    113,
    'Ms.',
    'Smythe',
    'Melanie',
    'P',
    '1995-09-15',
    '2020-05-11',
    '615',
    '324-9006',
    105
);

INSERT INTO EMP VALUES(
    114,
    'Ms.',
    'Brandon',
    'Marie',
    'G',
    '1981-11-02',
    '2004-11-15',
    '901',
    '882-0845',
    108
);

INSERT INTO EMP VALUES(
    115,
    'Mrs.',
    'Saranda',
    'Hermine',
    'R',
    '1997-07-25',
    '2018-04-23',
    '615',
    '324-5505',
    105
);

INSERT INTO EMP VALUES(
    116,
    'Mr.',
    'Smith',
    'George',
    'A',
    '1990-11-08',
    '2013-12-10',
    '615',
    '890-2984',
    108
);

/* EMPLOYEE rows					*/
INSERT INTO EMPLOYEE VALUES(
    100,
    'Mr.',
    'Kolmycz',
    'George',
    'D',
    '1967-06-15',
    '2010-03-15',
    11,
    '615',
    '324-5456'
);

INSERT INTO EMPLOYEE VALUES(
    101,
    'Ms.',
    'Lewis',
    'Rhonda',
    'G',
    '1990-03-19',
    '2011-04-25',
    10,
    '615',
    '324-4472'
);

INSERT INTO EMPLOYEE VALUES(
    102,
    'Mr.',
    'Vandam',
    'Rhett',
    NULL,
    '1983-11-14',
    '2015-12-20',
    6,
    '901',
    '675-8993'
);

INSERT INTO EMPLOYEE VALUES(
    103,
    'Ms.',
    'Jones',
    'Anne',
    'M',
    '1999-10-16',
    '2019-08-28',
    2,
    '615',
    '898-3456'
);

INSERT INTO EMPLOYEE VALUES(
    104,
    'Mr.',
    'Lange',
    'John',
    'P',
    '1996-11-08',
    '2019-10-20',
    2,
    '901',
    '504-4430'
);

INSERT INTO EMPLOYEE VALUES(
    105,
    'Mr.',
    'Williams',
    'Robert',
    'D',
    '2000-03-14',
    '2020-11-08',
    1,
    '615',
    '890-3220'
);

INSERT INTO EMPLOYEE VALUES(
    106,
    'Mrs.',
    'Smith',
    'Jeanine',
    'K',
    '1993-02-12',
    '2014-01-05',
    7,
    '615',
    '324-7883'
);

INSERT INTO EMPLOYEE VALUES(
    107,
    'Mr.',
    'Diante',
    'Jorge',
    'D',
    '1999-08-21',
    '2019-07-02',
    2,
    '615',
    '890-4567'
);

INSERT INTO EMPLOYEE VALUES(
    108,
    'Mr.',
    'Wiesenbach',
    'Paul',
    'R',
    '1991-02-14',
    '2017-11-18',
    4,
    '615',
    '897-4358'
);

INSERT INTO EMPLOYEE VALUES(
    109,
    'Mr.',
    'Smith',
    'George',
    'K',
    '1986-06-18',
    '2014-04-14',
    7,
    '901',
    '504-3339'
);

INSERT INTO EMPLOYEE VALUES(
    110,
    'Mrs.',
    'Genkazi',
    'Leighla',
    'W',
    '1995-05-19',
    '2015-12-01',
    6,
    '901',
    '569-0093'
);

INSERT INTO EMPLOYEE VALUES(
    111,
    'Mr.',
    'Washington',
    'Rupert',
    'E',
    '1991-01-03',
    '2018-06-21',
    3,
    '615',
    '890-4925'
);

INSERT INTO EMPLOYEE VALUES(
    112,
    'Mr.',
    'Johnson',
    'Edward',
    'E',
    '1986-05-14',
    '2008-12-01',
    13,
    '615',
    '898-4387'
);

INSERT INTO EMPLOYEE VALUES(
    113,
    'Ms.',
    'Smythe',
    'Melanie',
    'P',
    '1995-09-15',
    '2020-05-11',
    1,
    '615',
    '324-9006'
);

INSERT INTO EMPLOYEE VALUES(
    114,
    'Ms.',
    'Brandon',
    'Marie',
    'G',
    '1981-11-02',
    '2004-11-15',
    17,
    '901',
    '882-0845'
);

INSERT INTO EMPLOYEE VALUES(
    115,
    'Mrs.',
    'Saranda',
    'Hermine',
    'R',
    '1997-07-25',
    '2018-04-23',
    3,
    '615',
    '324-5505'
);

INSERT INTO EMPLOYEE VALUES(
    116,
    'Mr.',
    'Smith',
    'George',
    'A',
    '1990-11-08',
    '2013-12-10',
    8,
    '615',
    '890-2984'
);

/* 1 */
SELECT 
    INVOICE.INV_NUMBER,
    INVOICE.INV_DATE,
    PRODUCT.P_DESCRIPT,
    LINE.LINE_UNITS,
    LINE.LINE_PRICE,
    (LINE.LINE_UNITS * LINE.LINE_PRICE) AS SUBTOTAL
FROM 
    CUSTOMER
JOIN INVOICE ON CUSTOMER.CUS_CODE = INVOICE.CUS_CODE
JOIN LINE ON INVOICE.INV_NUMBER = LINE.INV_NUMBER
JOIN PRODUCT ON LINE.P_CODE = PRODUCT.P_CODE
WHERE 
    CUSTOMER.CUS_FNAME = 'Kathy' AND CUSTOMER.CUS_LNAME = 'Smith';
    
/* 2 */
SELECT 
    VENDOR.V_CODE,
    VENDOR.V_NAME,
    COUNT(PRODUCT.P_CODE) AS NUM_PRODS,
    ROUND(SUM(PRODUCT.P_PRICE), 2) AS TOTAL_PRICE
FROM 
    VENDOR
LEFT JOIN PRODUCT ON VENDOR.V_CODE = PRODUCT.V_CODE
GROUP BY 
    VENDOR.V_CODE, VENDOR.V_NAME;

/* 3 */
SELECT 
    PRODUCT.P_CODE AS "Product Code",
    PRODUCT.P_DESCRIPT AS "Description",
    VENDOR.V_CODE AS "Vendor Code",
    VENDOR.V_NAME AS "Vendor"
FROM 
    VENDOR
LEFT JOIN PRODUCT ON VENDOR.V_CODE = PRODUCT.V_CODE;

/* 4 */
SELECT 
    INVOICE.INV_DATE,
    PRODUCT.P_CODE,
    PRODUCT.P_DESCRIPT
FROM 
    INVOICE
JOIN LINE ON INVOICE.INV_NUMBER = LINE.INV_NUMBER
JOIN PRODUCT ON LINE.P_CODE = PRODUCT.P_CODE
WHERE 
    INVOICE.INV_NUMBER <= 1005;

/* 5 */
SELECT 
    CONCAT(mgr.EMP_FNAME, ' ', mgr.EMP_LNAME) AS Supervisor,
    COUNT(emp.EMP_NUM) AS Team_size
FROM 
    EMP emp
JOIN 
    EMP mgr ON emp.EMP_MGR = mgr.EMP_NUM
GROUP BY 
    Supervisor
ORDER BY 
    Team_size ASC;
    
/* 6 */
SELECT P_CODE, P_DESCRIPT FROM product WHERE YEAR(P_INDATE) = 2022 AND MONTH(P_INDATE) = 2;



