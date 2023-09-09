/*
  Purpose: This query demonstrates the use of partition by clauses for inline aggregation.
  Author: TH
  Date: 202309
*/

WITH m01_base_data AS (
  -- Generate a 48-row dummy table of random numbers
  SELECT
    TRUNC(SYSDATE) AS trading_date,
    LEVEL AS trading_period,
    ROUND(DBMS_RANDOM.VALUE(1, 100)) AS value
  FROM DUAL T1
  WHERE ROWNUM <= 48
  CONNECT BY LEVEL <= 48
)

-- Query Starts Here
SELECT
  s1.trading_period, -- Trading period
  s1.value, -- Random number

  -- Get value from the prior row
  MAX(s1.value) 
  OVER (PARTITION BY 1 
        ORDER BY s1.trading_period 
		ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING) AS prior_row_value,

  -- Get value from the next row
  MAX(s1.value) 
  OVER (PARTITION BY 1 
  ORDER BY s1.trading_period 
  ROWS BETWEEN 1 FOLLOWING AND 1 FOLLOWING) AS next_row_value,

  -- Get cumulative running total
  SUM(s1.value) 
  OVER (PARTITION BY 1 
        ORDER BY s1.trading_period 
		ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total,

  -- Get cumulative total remaining
  SUM(s1.value) 
  OVER (PARTITION BY 1 
        ORDER BY s1.trading_period 
		ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS total_remaining,

  -- Get running daily total
  SUM(s1.value) 
  OVER (PARTITION BY s1.trading_date 
        ORDER BY s1.trading_period 
		ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS daily_running_total,

  -- Get running daily total remaining
  SUM(s1.value) 
  OVER (PARTITION BY s1.trading_date 
        ORDER BY s1.trading_period 
		ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS daily_total_remaining,

  -- Calculate moving average over 5 trading periods
  ROUND(
    AVG(value) 
	OVER (PARTITION BY 1 
	      ORDER BY s1.trading_period 
		  ROWS BETWEEN 5 PRECEDING AND CURRENT ROW), 2
  ) AS moving_average

FROM m01_base_data s1;
