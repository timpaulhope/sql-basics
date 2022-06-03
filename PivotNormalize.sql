SELECT  TRADING_DATE,
        MEASURE,
        DATA_VALUE
FROM
        (
        /*<Create table of DateTime, Value, Value>*/
        SELECT  TRUNC (SYSDATE) - LEVEL AS TRADING_DATE,
                ROUND (DBMS_RANDOM.VALUE (1, 100)) AS VALUE1,
                ROUND (DBMS_RANDOM.VALUE (5, 10)) AS VALUE2
        FROM    DUAL
                CONNECT BY LEVEL <= 5
                /*</Create table of DateTime, Value, Value>*/
        ) UNPIVOT (DATA_VALUE FOR MEASURE IN (VALUE1, VALUE2)) ;
