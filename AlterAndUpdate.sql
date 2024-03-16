-- 
-- 
-- 
-- 
-- 
SELECT * FROM emp;

SELECT * FROM dept;

-- Auto Increment 
CREATE SEQUENCE product_id
MINVALUE 1
MAXVALUE 999999999
START WITH 1
INCREMENT BY 1
CACHE 20;




-- 5, 2 where 5.2 is LHS.RHS
CREATE TABLE products (
    product_id number not null,
    name varchar(50),
    product_cost number(5, 2),
    product_retail number(5, 2),
    product_type varchar(50),
    store_id number not null,

    CONSTRAINT product_pk PRIMARY KEY(product_id)
)

DESC products;

-- Alter Table


-- modify the table 
ALTER TABLE products MODIFY name varchar(30) NOT NULL;

ALTER TABLE products MODIFY product_cost number(6, 2) NOT NULL

-- rename a column 
ALTER TABLE products RENAME COLUMN product_id TO id;

DESC products;


-- 
-- 
-- basically adds a new row
-- add a constraint or a new field
ALTER TABLE products ADD religion varchar(30) DEFAULT 'GOD';

-- adding a not null constraint products is the table and name is the column name
ALTER TABLE products ADD CONSTRAINT products_name_unique UNIQUE(name);


-- this kind of table coppy coppys the values to
CREATE TABLE employeeBuyer AS
SELECT empno, ename, job, mgr, sal, deptno
FROM emp;

DROP TABLE employeeBuyer CASCADE CONSTRAINT;

SELECT * FROM employeeBuyer;
DESC employeeBuyer;

-- adds a primary key to employeeBuyer
ALTER TABLE employeeBuyer ADD CONSTRAINT employeeBuyer_pk PRIMARY KEY(empno);

SELECT * FROM employeeBuyer;

-- updates the sal
UPDATE employeeBuyer eb SET eb.sal = 10000 WHERE eb.ename = 'KING' 

SELECT * FROM employeeBuyer;

-- update with join
UPDATE SELECT employeeBuyer eb 
INNER JOIN dept d 
ON eb.deptno = d.deptno
SET eb.sal = 11000 
WHERE d.loc = 'new york';

-- update with join
UPDATE employeeBuyer eb
SET eb.sal = 11000
WHERE eb.deptno IN (SELECT d.deptno FROM employeeBuyer e JOIN dept d ON e.deptno = d.deptno WHERE d.loc = 'NEW YORK');

SELECT * FROM employeeBuyer; 









