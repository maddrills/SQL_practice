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























