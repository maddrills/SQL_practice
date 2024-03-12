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

#10-03-2025
#
#
#
-- group by

SELECT * FROM emp;

SELECT * FROM dept;


-- sum up salary per job role
SELECT e.job, SUM(e.sal) FROM emp e
GROUP BY e.job;


-- individual salarys per person and job role then sum up per job role and name
SELECT NVL(e.ename, '-----TOTAL-----'), e.job, SUM(e.sal)
FROM emp e GROUP BY ROLLUP(e.job, e.ename);

-- or with all the padding
SELECT NVL(e.ename, RPAD(LPAD('TOTAL',20,'-'),40,'-')), e.job, SUM(e.sal)
FROM emp e GROUP BY ROLLUP(e.job, e.ename);

--  group by job title order by sal asc top to bottom 4150 -> 8275
SELECT e.job, sum(e.sal) AS "TOTAL"
FROM emp e GROUP BY e.job ORDER BY TOTAL ASC;

-- group by desc top to bottom 8275 -> 4150
SELECT e.job, SUM(e.sal) AS "TOTAL"
FROM emp e GROUP BY e.job ORDER BY TOTAL DESC;


-- group by with condition having must come immediately after group by
SELECT e.job, SUM(e.sal) AS "TOTAL"
FROM emp e GROUP BY e.job HAVING SUM(e.sal) > 4900
ORDER BY TOTAL DESC;

-- can also use nested query does the same as above
SELECT * FROM(
SELECT e.job, SUM(e.sal) AS "TOTAL"
FROM emp e GROUP BY e.job ORDER BY TOTAL DESC
) WHERE TOTAL > 4900;


-- JOIN LJOIN RIGHT FULL-OUTER-JOIN INNER-JOIN 

-- most basic join kind of like a full join
SELECT * FROM emp, dept
WHERE emp.deptno = dept.deptno;


-- puting conditions for the above
SELECT * FROM emp, dept
WHERE emp.deptno = dept.deptno
AND emp.sal > 4999;


--Inner Join
SELECT * FROM emp e
INNER JOIN dept d 
ON e.deptno = d.deptno;


-- Full Join
SELECT * FROM emp e
FULL OUTER JOIN dept d
ON e.deptno = d.deptno

-- Left Join here every employe is in a dipartment if not right table will have a null association
SELECT * FROM emp e
LEFT OUTER JOIN dept d
ON e.deptno = d.deptno;


--Right join depat doesnt have a employee thats why bosten has a null association
SELECT * FROM emp e
RIGHT OUTER JOIN dept d
ON e.deptno = d.deptno;
#
#
#
###EOF
#
#
#
#

SELECT * FROM emp;

SELECT * FROM dept;

-- select manager
SELECT e.ename, NVL(e.mgr, 0) FROM emp e
WHERE e.mgr IS NULL;


-- group by with rollup 
SELECT NVL(e.ename, '-----TOTAL-----'), e.job, SUM(e.sal)
FROM emp e GROUP BY ROLLUP(e.job, e.ename);


--  employees with a manager
SELECT * FROM emp e 
WHERE e.mgr IS NOT NULL;  


-- self join employes with reporting to King
SELECT * FROM emp e
WHERE e.mgr 
= (SELECT en.empno FROM emp en WHERE en.mgr IS NULL);


--self join where emp reports to managers
SELECT emp.* FROM emp WHERE emp.mgr IN(
SELECT e.empno FROM emp e WHERE e.job = 'MANAGER');


--self join where employes have othere employes id as there manager row
SELECT emp.* FROM emp WHERE emp.mgr IN (
SELECT e.empno FROM emp e);

-- also a litterel prefered self join notice how king is not in o/p
SELECT e.ename, e.job FROM emp e 
INNER JOIN emp en
ON e.mgr = en.empno;
#
#
#
#
#EOF
--table create and auto increment
-- creating a student db




CREATE TABLE student(
    student_id int,
    name varchar(60),
    age number,
    constraint student_primary_key_constraint PRIMARY KEY(student_id)
);

CREATE TABLE teacher(
    teacher_id int,
    name varchar(65),
    age number,
    constraint teacher_primary_key_constraint PRIMARY KEY(teacher_id)
);

CREATE TABLE student_teacher(
    student_id int ,
    teacher_id int ,
    CONSTRAINT student_teacher_primary_key_constraint PRIMARY KEY(student_id, teacher_id),
    CONSTRAINT student_foreign_key_constraint FOREIGN KEY(student_id) REFERENCES student(student_id) ON DELETE CASCADE,
    CONSTRAINT teacher_foreign_key_constraint FOREIGN KEY(teacher_id) REFERENCES teacher(teacher_id) ON DELETE CASCADE,
);


DROP TABLE student_teacher;
DROP TABLE teacher;
-- drops constraints int the referncing table then delets itself
DROP TABLE student CASCADE CONSTRAINT;


-- autoincrement  cache first 20 values for student
CREATE SEQUENCE product_seq
MINVALUE 1
MAXVALUE 9999999999
START WITH 1
INCREMENT BY 1
CACHE 20;

-- create sequence for teacher
CREATE SEQUENCE teacher_seq
MINVALUE 1
MAXVALUE 9999999999
START WITH 1
INCREMENT BY 1
CACHE 20;

INSERT INTO student(student_id, name, age) VALUES(product_seq.NEXTVAL, 'Mathew', 25);
INSERT INTO student(student_id, name, age) VALUES(product_seq.NEXTVAL, 'george', 27);
INSERT INTO student(student_id, name, age) VALUES(product_seq.NEXTVAL, 'Violet', 23);
#
#
#
#
###
12-03-2024
SELECT * FROM emp;

SELECT *FROM dept;


-- job_grade shoud hold data of salarys

CREATE VIEW sal_range AS
SELECT MAX(e.sal) AS "MAXI", MIN(e.sal) AS "MINI"
FROM emp e
GROUP BY e.job;

DROP VIEW sal_range;


SELECT * FROM job_grade;

-- makes no sense using this 
SELECT e.ename, e.sal FROM emp e 
JOIN sal_range s
ON e.sal BETWEEN s.MAXI AND s.MINI



SELECT * FROM sal_range; 


CREATE TABLE grader_sal(
    grade char(1),
    min_sal number,
    max_sal number
);


INSERT INTO grader_sal VALUES ('E', 0 , 1000);
INSERT INTO grader_sal VALUES ('D', 1001 , 2000);
INSERT INTO grader_sal VALUES ('C', 2001 , 3000);
INSERT INTO grader_sal VALUES ('B', 3001 , 4000);
INSERT INTO grader_sal VALUES ('A', 4001 , 5000);


SELECT * FROM grader_sal;

DROP TABLE grader_sal;

CREATE VIEW grade_this AS select * from grader_sal ORDER BY grade;


-- this grades all the salaries below is a non eque join
SELECT e.ename, e.sal, g.grade 
FROM emp e
JOIN grader_sal g 
ON e.sal BETWEEN g.min_sal AND g.max_sal
ORDER BY g.grade;


-- casting o/p 3 can be applyed on date time etc to get output 
SELECT CAST(3.14159265 AS int) FROM dual; 

-- nicelly formated
SELECT to_char(CAST(3.14159265 AS int), '$9999999999') pi_doler FROM dual;


-- without row condition
SELECT e.ename, e.sal,
CASE
WHEN e.sal BETWEEN 4000 AND 5000 THEN 'waaaw nice'
WHEN e.sal BETWEEN 3000 AND 4999 THEN 'not bad not bad'
ELSE 'Shit nooooo'
END sal_grade
FROM emp e ORDER BY e.sal DESC;


-- without an else statement works but for values not in the range sal_grade will be null
SELECT e.ename, e.sal,
CASE
WHEN e.sal BETWEEN 4000 AND 5000 THEN 'waaaw nice'
WHEN e.sal BETWEEN 3000 AND 4999 THEN 'not bad not bad'
-- ELSE 'Shit nooooo'
END sal_grade
FROM emp e ORDER BY e.sal DESC;



-- conditional statement with row lim condition
SELECT e.ename, e.sal,
CASE
WHEN e.sal BETWEEN 4000 AND 5000 THEN 'waaaw nice'
WHEN e.sal BETWEEN 3000 AND 4999 THEN 'not bad not bad'
ELSE 'Shit nooooo'
END sal_grade
FROM emp e 
WHERE rownum < 10 ORDER BY e.sal DESC;
#
#
#
#
#
###
























































