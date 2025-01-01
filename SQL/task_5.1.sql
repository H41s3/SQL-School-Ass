-- tables.sql
CREATE TABLE EMPLOYEE (
    EMPLOYEENAME CHAR(15) NOT NULL,
    STREET CHAR(15),
    CITY CHAR(10),
    PRIMARY KEY (EMPLOYEENAME)
);
CREATE TABLE WORKS(
    EMPLOYEENAME CHAR(15) NOT NULL,
    COMPANYNAME CHAR(15) NOT NULL,
    SALARY NUMERIC(7),
    PRIMARY KEY (EMPLOYEENAME, COMPANYNAME),
    CHECK (SALARY >=0)
);

CREATE TABLE MANAGES (
    EMPLOYEENAME CHAR(15) NOT NULL,
    MANAGERNAME CHAR(15),
    PRIMARY KEY (EMPLOYEENAME)
);

CREATE TABLE COMPANY (
    COMPANYNAME CHAR(15) NOT NULL,
    CITY CHAR(10) NOT NULL,
    PRIMARY KEY (COMPANYNAME, CITY)
);



-- data.sql
-- insert data in the employee table
INSERT INTO EMPLOYEE VALUES (
    'Jones',
    'Main',
    'Harrison'
);

INSERT INTO EMPLOYEE VALUES (
    'Smith',
    'North',
    'Rye'
);

INSERT INTO EMPLOYEE VALUES (
    'Hayes',
    'Main',
    'Harrison'
);

INSERT INTO EMPLOYEE VALUES (
    'Curry',
    'North',
    'Rye'
);

INSERT INTO EMPLOYEE VALUES (
    'Lindsay',
    'Park',
    'Pittsfield'
);

INSERT INTO EMPLOYEE VALUES (
    'Turner',
    'Putname',
    'Stamford'
);

INSERT INTO EMPLOYEE VALUES (
    'Williams',
    'Nassus',
    'Princeton'
);

INSERT INTO EMPLOYEE VALUES (
    'Adams',
    'Spring',
    'Pittsfield'
);

-- insert data in the company table
INSERT INTO COMPANY VALUES(
    'Waltons',
    'Harrison'
);

INSERT INTO COMPANY VALUES(
    'Meyer',
    'Rye'
);

INSERT INTO COMPANY VALUES(
    'Waltons',
    'Rye'
);

INSERT INTO COMPANY VALUES(
    'Woolworths',
    'Pittsfield'
);

INSERT INTO COMPANY VALUES(
    'Tweeties',
    'Harrison'
);

INSERT INTO COMPANY VALUES(
    'Firebrand',
    'Woodside'
);

-- insert data in the works table
INSERT INTO WORKS VALUES (
    'Jones',
    'Tweeties',
    21000
);

INSERT INTO WORKS VALUES (
    'Smith',
    'Waltons',
    22000
);

INSERT INTO WORKS VALUES (
    'Hayes',
    'Woolworths',
    19000
);

INSERT INTO WORKS VALUES (
    'Curry',
    'Meyer',
    25000
);

INSERT INTO WORKS VALUES (
    'Lindsay',
    'Meyer',
    9000
);

INSERT INTO WORKS VALUES (
    'Turner',
    'Firebrand',
    20000
);

INSERT INTO WORKS VALUES (
    'Williams',
    'Tweeties',
    18000
);

INSERT INTO WORKS VALUES (
    'Adams',
    'Meyer',
    22000
);

-- insert data in the works table
INSERT INTO MANAGES VALUES (
    'Jones',
    'Collins'
);

INSERT INTO MANAGES VALUES (
    'Smith',
    'Collins'
);

INSERT INTO MANAGES VALUES (
    'Hayes',
    'Wills'
);

INSERT INTO MANAGES VALUES (
    'Curry',
    'Wills'
);

INSERT INTO MANAGES VALUES (
    'Lindsay',
    'Mulhare'
);

INSERT INTO MANAGES VALUES (
    'Turner',
    'Mulhare'
);

INSERT INTO MANAGES VALUES (
    'Williams',
    'Bond'
);

INSERT INTO MANAGES VALUES (
    'Adams',
    'Bond'
);
