/*
==================================
Oracle Pivot Statement example
201811 TH
Process Flow:
- Generate a bunch of random numbers for
o 48 trading periods; and
o 3 'Blocks'
- Pivot the data so that you get the sum of
the random numbers for each block by
trading period
==================================
*/
/*
==================================
Base Data Starts here
==================================
*/
WITH M01_BASE_DATA AS
        (
        /*Combine block and trading period tables*/
        SELECT  S1.TRADING_PERIOD,
                S2.BLOCK,
                ROUND (DBMS_RANDOM.VALUE (5, 100)) AS VALUE
        FROM
                (
                /*Use dual to build a trading period table*/
                SELECT  LEVEL AS TRADING_PERIOD
                FROM    DUAL T1
                        CONNECT BY LEVEL <= 48
                        /**/
                ) S1,
                (
                /*Use dual to build a block table*/
                SELECT  DECODE (LEVEL, 1, 'GT26', 2, 'GT21', 3, 'GT22') AS BLOCK
                FROM    DUAL T1
                        CONNECT BY LEVEL <= 3
                        /**/
                ) S2
                /**/
        )
/*
==================================
Output Data Starts Here
==================================
*/
SELECT  TRADING_PERIOD,
        TCC,
        GT21,
        GT22
FROM    M01_BASE_DATA PIVOT (
        /**/
        SUM (VALUE) FOR BLOCK IN ('TCC' AS TCC, 'GT21' AS GT21, 'GT22' AS GT22)
        /**/
        )
ORDER BY TRADING_PERIOD ; 
