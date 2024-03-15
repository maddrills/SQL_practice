--
-- 
-- 
-- UNBOUNDED and BOUNDED
-- 
-- 
-- 
-- changes the default a window function is sumed ranked etc

--  default behaviour

SELECT e.*, rank() OVER(ORDER BY e.sal) FROM emp e;

--adding rows with unbounded preceading doesent work with rank

-- sums everything concurently 1 + 1+2 + 1+2+3 + 1+2+3+4 +
SELECT e.*, sum(e.sal) OVER(ORDER BY e.sal ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) FROM emp e

-- sums the value just above it 1+0 + 2+1 + 3+2 + 4+3
SELECT e.*, sum(e.sal) OVER(ORDER BY e.sal ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) FROM emp e


-- first value showen 800
SELECT e.*, first_value(e.sal) OVER(ORDER BY e.sal) FROM emp e


-- the output is weard becasue it comapes first with forst then first with second and so on op will be 800 950 1100 wich is not the desired value. We want 2850
SELECT e.*, last_value(e.sal) OVER(ORDER BY e.sal) FROM emp e

-- do this instead now op is 5000
-- order of writing the query is important for it to work
-- counts from the back
SELECT e.*, last_value(e.sal) OVER(ORDER BY e.sal RANGE BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) FROM emp e;


-- lag is value before lead is the next value

SELECT e.*, to_char(LAG(e.sal) OVER(ORDER BY e.sal),'$99999999'), to_char(LEAD(e.sal) OVER(ORDER BY e.sal), '$999999999') FROM emp e;






