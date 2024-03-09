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
#
#
#
#
####EOF




SELECT * FROM emp;

SELECT * FROM dept;


SELECT sysdate FROM dual;

-- adding months to a date added 12 moths 03/09/2025
SELECT add_months('03-09-2024', 12) FROM dual;
-- 05/09/2025
SELECT add_months('03-09-2024', 14) FROM dual;

-- formating date to day month year

SELECT to_char(add_months(sysdate, 9), 'dd-mm-yyyy') FROM dual


-- time stam shows both date and time
-- 09-MAR-24 02.20.37.792900 AM +00:00
SELECT systimestamp FROM dual;

--  you can aslo trunck the data to get just the date 03/09/2024
SELECT trunc(sysTimeStamp) AS "truncDateTimeStamp" FROM dual;



--  shows the first moth of the input date 03/01/2024
SELECT trunc(sysTimeStamp, 'MONTH') FROM dual;

-- 01/01/2024 start of the year as per given date 
SELECT trunc(sysTimeStamp, 'YEAR') FROM dual;


-- you can aso formate the date in a stylish way
-- 09th of march --and the year is: 2024
SELECT to_char(systimestamp, 'ddth "of" month "--and the year is: " yyyy') FROM dual;

-- convert a string to a date  07/21/1998
CREATE VIEW date_oops AS SELECT to_date('21-07-1998', 'dd,mm,yyyy') AS "CON_DATE" FROM dual;
-- now we can perform date operations on it 
--  before trunc 07/21/1998 after 07/01/1998
SELECT trunc(CON_DATE, 'MONTH') from date_oops;

-- -313.41935483870967741935483870967741936 small - big
SELECT months_between((SELECT CON_DATE FROM date_oops), to_char(trunc(systimestamp),'dd-mm-yyyy'))FROM dual;

--313.419354838709677419354838709677419355
SELECT months_between(to_char(trunc(systimestamp),'dd-mm-yyyy'), (SELECT CON_DATE FROM date_oops))FROM dual;

---- big - small 313 also use to date to format a date to compute
SELECT trunc(months_between(to_date(trunc(systimestamp),'dd-mm-yyyy'), (SELECT CON_DATE FROM date_oops))) FROM dual;


SELECT '07-21-2024' FROM dual;

-- big - small 4 you can also comput with a string date
SELECT trunc(months_between('07-21-2024',trunc(systimestamp))) FROM dual;
#
#
#
#
#EOF


























