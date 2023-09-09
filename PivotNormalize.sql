/*
  Purpose: This query un-pivots (normalises) data to transform a table of DateTime and multiple values into a more compact format.
  Author: TH
  Date: 202309
*/

SELECT
  TRADING_DATE,
  MEASURE,
  DATA_VALUE
FROM (
  -- Use dual to create a 5 row table table of DateTime, Value1, and Value2
  SELECT
    TRUNC(SYSDATE) - LEVEL AS TRADING_DATE,
    ROUND(DBMS_RANDOM.VALUE(1, 100)) AS VALUE1,
    ROUND(DBMS_RANDOM.VALUE(5, 10)) AS VALUE2
  FROM DUAL
  WHERE ROWNUM <= 5
  CONNECT BY LEVEL <= 5) 
UNPIVOT (DATA_VALUE FOR MEASURE IN (VALUE1, VALUE2));
