SELECT
        /*current date/time */
        SYSDATE,
        /* current date only */
        TRUNC (SYSDATE),
        /* Current Year */
        TO_NUMBER (TO_CHAR (SYSDATE, 'YYYY')),
        /* current date/hour */
        TRUNC (SYSDATE, 'HH'),
        /* current date/hour/minute */
        TRUNC (SYSDATE, 'MI'),
        /* current date/time + 30 minutes */
        SYSDATE + INTERVAL '30' MINUTE,
        /* current date/time - 30 minutes */
        SYSDATE - INTERVAL '30' MINUTE,
        /* current date/time + 1 Hour*/
        SYSDATE + INTERVAL '1' HOUR,
        /* current day + 1 day */
        TRUNC (SYSDATE) + 1,
        /* current day - 1 day */
        TRUNC (SYSDATE) - 1,
        /* current day + 1 month */
        ADD_MONTHS (TRUNC (SYSDATE), 1),
        /* current day - 1 month */
        ADD_MONTHS (TRUNC (SYSDATE), - 1),
        /* Last day of the month */
        LAST_DAY (TRUNC (SYSDATE)),
        /*First day of the month */
        TRUNC (SYSDATE,'MON'),
        /*First day of the year */
        TRUNC (SYSDATE, 'YEAR'),
        /*the next friday */
        NEXT_DAY (TRUNC (SYSDATE), 'FRI'),
        /*last friday */
        NEXT_DAY (TRUNC (SYSDATE) - 8, 'FRI'),
        /*ISO 8601 date format */
        TO_NUMBER (TO_CHAR (SYSDATE, 'YYYYMMDDHH24MISS')),
        /* First trading Period ID of the day */
        TO_NUMBER (TO_CHAR (SYSDATE, 'YYYYMMDD') ||
        '01'),
        /* Current trading Period ID */
        TO_NUMBER (TO_CHAR (SYSDATE, 'YYYYMMDD')) * 100 + CEIL ( (SYSDATE - TRUNC (SYSDATE)) * 48),
        /* Current day less three days using NUMTODSINTERVAL */
        TRUNC (SYSDATE) - NUMTODSINTERVAL (3, 'day'),
        /*current time rounded down to nearest half hour*/
        TRUNC (SYSDATE) + (FLOOR ( (SYSDATE - TRUNC (SYSDATE)) * 48) / 48),
        /*TRADING PERIOD 12 hours ago*/
        TO_NUMBER (TO_CHAR (SYSDATE - NUMTODSINTERVAL (12, 'hour'), 'YYYYMMDD')) * 100 + CEIL ( (SYSDATE - NUMTODSINTERVAL (12, 'hour') - TRUNC (SYSDATE - NUMTODSINTERVAL (12, 'hour'))) * 48)
FROM    DUAL; 
