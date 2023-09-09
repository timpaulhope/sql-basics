/*
  This query pivots (de-normalises) random numbers for 48 trading periods and 3 blocks to calculate the sum of values for each block by trading period.
  Author: TH
  Date: 202309
*/
WITH M01_BASE_DATA AS (
  SELECT
    S1.TRADING_PERIOD,
    S2.BLOCK,
    -- add a random number between 5 and 100
    ROUND(DBMS_RANDOM.VALUE(5, 100)) AS VALUE
  FROM (
    -- create a table of 48 trading periods using dual
    SELECT LEVEL AS TRADING_PERIOD
    FROM DUAL T1
    WHERE ROWNUM <= 48
    CONNECT BY LEVEL <= 48
  ) S1,
  (
    -- create a table of three blocks using dual
    SELECT DECODE(LEVEL, 1, 'VAR1', 2, 'VAR2', 3, 'VAR3') AS BLOCK
    FROM DUAL T1
    WHERE ROWNUM <= 3
    CONNECT BY LEVEL <= 3
  ) S2
)

-- Pivot the data to get the sum of values for each block by trading period.

SELECT
  TRADING_PERIOD,
  VAR1,
  VAR2,
  VAR3
FROM M01_BASE_DATA
PIVOT (
  SUM(VALUE)
  FOR BLOCK IN ('VAR1' AS VAR1, 'VAR2' AS VAR2, 'VAR3' AS VAR3)
)
ORDER BY TRADING_PERIOD;
