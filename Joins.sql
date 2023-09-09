
/*
  Purpose: This creates two recursive tables of different lengths .
  Author: TH
  Date: 202309
*/

WITH SIX_DAYS_TABLE AS (
  -- Generates a table of trading dates for the period d[-6]d[-1]
  SELECT
    TRUNC(SYSDATE) - LEVEL AS TRADING_DATE,
    -- Generate random values for six days
    ROUND(DBMS_RANDOM.VALUE(1, 100)) AS SIX_DAYS_VALUE
  FROM DUAL
  WHERE ROWNUM <= 6 -- Limit the number of rows to six
  CONNECT BY LEVEL <= 6 -- Generate rows using a recursive query
),

FOUR_DAYS_TABLE AS (
  -- Generates a table of trading dates for the period d[-3]d[0]
  SELECT
    TRUNC(SYSDATE) - (LEVEL - 1) AS TRADING_DATE,
    -- Generate random values for four days
    ROUND(DBMS_RANDOM.VALUE(1, 100)) AS FOUR_DAYS_VALUE
  FROM DUAL
  WHERE ROWNUM <= 4 -- Limit the number of rows to four
  CONNECT BY LEVEL <= 4 -- Generate rows using a recursive query
)

-- You can now perform SQL operations on SIX_DAYS_TABLE and FOUR_DAYS_TABLE
-- Try swapping out the INNER JOIN with a LEFT JOIN, RIGHT JOIN, or FULL JOIN to see what happens

SELECT
  -- Alias and select columns from SIX_DAYS_TABLE
  S.TRADING_DATE AS SIX_DAYS_TRADING_DATE,
  S.SIX_DAYS_VALUE AS SIX_DAYS_VALUE,
  -- Alias and select columns from FOUR_DAYS_TABLE
  F.TRADING_DATE AS FOUR_DAYS_TRADING_DATE,
  F.FOUR_DAYS_VALUE AS FOUR_DAYS_VALUE
FROM
  -- Join SIX_DAYS_TABLE and FOUR_DAYS_TABLE based on TRADING_DATE
  SIX_DAYS_TABLE S
INNER JOIN
  FOUR_DAYS_TABLE F
ON
  S.TRADING_DATE = F.TRADING_DATE;
