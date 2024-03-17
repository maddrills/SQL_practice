-- Index things 
-- man i feel drousy doing this every day
--index is used to better stor data to be quried later 
-- say you want a fast search on employee names

CREATE INDEX emp_index
ON emp(ename);

-- this is suposed to be faster 
SELECT * FROM emp e WHERE e.ename LIKE 'J%';


-- can even create unique indexs 
-- NOTE a primary in a table is indexed by default 



-- You can also create a multi column indexow 
-- now when your condition in search has all three fiels in it eg ename and job and mgr then the search will use an index
CREATE INDEX multi_col_emp_index
ON emp(ename, job, mgr)

DROP INDEX multi_col_emp_index;

SELECT * FROM emp e
WHERE e.ename = 'KING'
AND job = 'PRESIDENT'
AND e.mgr is null;


-- Compute statistics is a better way of storing data
CREATE INDEX stat_index_emp
ON emp(ename, sal)
COMPUTE STATISTICS;

SELECT * FROM emp e
WHERE e.ename LIKE 'J%'
AND e.sal > 950;



SELECT * FROM employee
-- REMOVE REDUNDENT JOBS 
-- here rowid is an sql query id that comes with every table
-- AO2RDaAAAAAGjlbAAA ill be some gibrish
SELECT min(rowid)
FROM employee e;



-- but you can use it here we dont have redundent data what have the same group by data twice
SELECT min(rowid), e.ename, e.job
FROM employee e
GROUP BY e.ename, e.job;


-- but there is a way you can simulate this
-- the below query will count the number of repeats as rowid provids one unique id per data
SELECT count(rowid), e.job
FROM employee e
GROUP BY e.job;


-- the min data as per row count where job name is only repeated once
SELECT count(rowid)
FROM employee e
GROUP BY e.job HAVING count(rowid) = 1;











