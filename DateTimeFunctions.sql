/*
  Purpose: This query demonstrates common Oracle datetime functions.
  Author: TH
  Date: 202309
*/

SELECT
  -- Current date/time
  SYSDATE AS current_datetime,
  
  -- Current date without the time component
  TRUNC(SYSDATE) AS current_date,

  -- Current year as a number
  TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) AS current_year,
  
  -- Current date and hour
  TRUNC(SYSDATE, 'HH') AS current_date_hour,
  
  -- Current minute with seconds removed
  TRUNC(SYSDATE, 'MI') AS current_minute,

  -- Current datetime + 30 Minutes
  SYSDATE + INTERVAL '30' MINUTE AS future_datetime_30min,
  
  -- Current datetime - 30 minutes
  SYSDATE - INTERVAL '30' MINUTE AS past_datetime_30min,

  -- Current datetime + 1 hour
  SYSDATE + INTERVAL '1' HOUR AS future_datetime_1hour,

  -- Current day + 1 day
  TRUNC(SYSDATE) + 1 AS next_day,
  
  -- Current day - 1 day
  TRUNC(SYSDATE) - 1 AS previous_day,

  -- Current day + one month
  ADD_MONTHS(TRUNC(SYSDATE), 1) AS next_month,

  -- Current day - one month
  ADD_MONTHS(TRUNC(SYSDATE), -1) AS previous_month,

  -- Last day of the current month
  LAST_DAY(TRUNC(SYSDATE)) AS last_day_of_month,

  -- First day of the month
  TRUNC(SYSDATE, 'MON') AS first_day_of_month,

  -- First day of the year
  TRUNC(SYSDATE, 'YEAR') AS first_day_of_year,

  -- Date of the next Friday
  NEXT_DAY(TRUNC(SYSDATE), 'FRI') AS next_friday,

  -- Date of the last Friday
  NEXT_DAY(TRUNC(SYSDATE) - 8, 'FRI') AS last_friday,

  -- Date as a number in ISO8601 format
  TO_NUMBER(TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')) AS iso8601_datetime,

  -- Current day - three days using NUMTODSINTERVAL
  TRUNC(SYSDATE) - NUMTODSINTERVAL(3, 'day') AS three_days_ago,

  -- Current time rounded down to the nearest half-hour
  TRUNC(SYSDATE) + (FLOOR((SYSDATE - TRUNC(SYSDATE)) * 48) / 48) AS rounded_current_time
FROM DUAL;

/* Eof */
