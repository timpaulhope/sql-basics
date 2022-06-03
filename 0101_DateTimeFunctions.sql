/*== 
  This is a collection of common Oracle datetime functions. 
  TH 202205
==*/
SELECT  SYSDATE,                                           -- current date/time
        TRUNC (SYSDATE),                                   -- current date less time component
        TO_NUMBER (TO_CHAR (SYSDATE, 'YYYY')),             -- current year converted to string then number
        TRUNC (SYSDATE, 'HH'),                             -- current date and hour
        TRUNC (SYSDATE, 'MI'),                             -- current minute with seconds removed
        SYSDATE + INTERVAL '30' MINUTE,                    -- current datetime + 30 Minutes
        SYSDATE - INTERVAL '30' MINUTE,                    -- current datetime + 30 minutes
        SYSDATE + INTERVAL '1' HOUR,                       -- current datetime + 1 hour
        TRUNC (SYSDATE) + 1,                               -- current day + 1 day
        TRUNC (SYSDATE) - 1,                               -- current day less one day
        ADD_MONTHS (TRUNC (SYSDATE), 1),                   -- current day + one month
        ADD_MONTHS (TRUNC (SYSDATE), - 1),                 -- current day less one month
        LAST_DAY (TRUNC (SYSDATE)),                        -- last day of the current month
        TRUNC (SYSDATE,'MON'),                             -- first day of the month
        TRUNC (SYSDATE, 'YEAR'),                           -- first day of the year
        NEXT_DAY (TRUNC (SYSDATE), 'FRI'),                 -- date of the next Friday
        NEXT_DAY (TRUNC (SYSDATE) - 8, 'FRI'),             -- date of the last friday
        TO_NUMBER (TO_CHAR (SYSDATE, 'YYYYMMDDHH24MISS')), -- date as number in ISO8601 format
        TRUNC (SYSDATE) - NUMTODSINTERVAL (3, 'day'),      -- current day less three days using NUMTODSINTERVAL
        TRUNC (SYSDATE) 
      + (FLOOR ( (SYSDATE - TRUNC (SYSDATE)) * 48) / 48),  -- current time rounded down to the nearest half our 
FROM    DUAL; 

/* == Eof == */
