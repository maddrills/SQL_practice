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























