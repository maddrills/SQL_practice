#01-03-2024
SELECT * FROM emp;

SELECT * FROM dept WHERE rownum < 10;

SELECT DISTINCT job FROM emp;

SELECT * FROM (
SELECT e.job, SUM(e.sal) AS "SAL"
FROM emp e GROUP BY e.job) WHERE SAL > 5000;

SELECT e.job, SUM(e.sal) AS "SAL"
FROM emp e 
GROUP BY e.job 
HAVING  SUM(e.sal) > 5000; 

SELECT * FROM (
SELECT e.job, e.sal AS "SAL"
FROM emp e) WHERE SAL > 500;
#
#
#01-03-2024
#EOF


#02-03-2024
SELECT * FROM emp;

SELECT * FROM emp e
WHERE (e.comm = 0 OR e.comm IS null) 
AND e.sal BETWEEN 3000 AND 10000;

SELECT * FROM emp ORDER BY sal ASC;

SELECT * FROM emp ORDER BY sal,comm ASC;
#
#
#02-03-2024
#EOF






#08-03-2024

SELECT * FROM emp;

-- the || cymbol acts as a concatinater
SELECT e.ename || '__' || e.hiredate AS "EMPLYEE_HIREDATE", e.sal
FROM emp e
WHERE e.comm IS NOT NULL; 

-- returns data where employee's commision = o or commision is null
SELECT e.ename || ' ' || e.hiredate AS "EMPLYEE_HIREDATE", e.sal
FROM emp e
WHERE e.comm = 0 OR e.comm IS NULL; 


-- CREATING A VIEW 
CREATE VIEW EMPLOYEE_NO_COMM AS(
SELECT e.ename || ' ' || e.hiredate AS "EMPLYEE_HIREDATE", e.sal
FROM emp e
WHERE e.comm = 0 OR e.comm IS NULL); 


SELECT * FROM employee_no_comm;

-- bellow query will use the view to filter out saleries that have a limit and are not a perticular value <> means not equal 
SELECT e.* FROM employee_no_comm e 
WHERE e.sal BETWEEN 2500 AND 5000
AND e.sal <> 2850;

-- same thing above without views remember the brackets get evaluated first (1, 0) AND 1 AND 1  with which 1 OR 0 AND 1 AND 1
SELECT e.ename || ' ' || e.hiredate AS "EMPLYEE_HIREDATE", e.sal
FROM emp e
WHERE (e.comm = 0 OR e.comm IS NULL)
AND e.sal BETWEEN 2500 AND 5000
AND e.sal <> 2850; 


-- upper case a word
SELECT upper('hesoyam') FROM dual;

-- lower case

SELECT lower(upper('hesoyam')) FROM dual;

-- capitalise just the first letters of a word Hello My Name A Borat I Like Its Very Good

SELECT initcap('hello my name a borat i like its very good') FROM dual;

-- count the number of words rown number limits the row

SELECt count('hello my name') FROM dual AND rownum < 10;


-- sub string ellow
SELECT substr('helloworld',2,5) FROM dual;

-- sub string from the back o/p wo
SELECT substr('helloworld',-5,2) FROM dual;


-- right pad count 5 and op hi$$$
SELECT rpad('hi',5,'$') FROM dual;

-- trim the left ocuurence of the letter h o/p  ello
SELECT ltrim('hhhhhhello','h') FROM dual;


-- round a desemal number 58.64
SELECT round(58.6382, 2) FROM dual;


-- give a number a domain 1arg is the number 2arg is the formatrer
-- $4567.45
SELECT to_char(4567.45, '$99999.99') from DUAL;
-- 000567.77
SELECT to_char(567.77, '000000.00') FROM dual;























