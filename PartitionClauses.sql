/*==
  This collection of functions shows you how to use partition by clauses to do inline aggregation
  TH 202205
==*/
WITH M01_BASE_DATA AS  (
        /* this generates a 48 row dummy table of random numbers */
        SELECT  TRUNC(SYSDATE) AS TRADING_DATE,  
	        LEVEL AS TRADING_PERIOD,
	        -- generate a random number --
                ROUND (DBMS_RANDOM.VALUE (1, 100)) 
	        AS VALUE                            
        FROM    DUAL T1
        WHERE   ROWNUM <= 48
	CONNECT BY LEVEL <= 48
        /**/
        )
/*==
  Build Starts Here
==*/
SELECT  S1.TRADING_PERIOD,                 -- return the trading period
        S1.VALUE,                          -- return random number
	-- get value from prior row --
        MAX  (S1.VALUE) 
	OVER (PARTITION BY 1 
	      ORDER BY S1.TRADING_PERIOD 
	      ROWS BETWEEN 1 PRECEDING 
	           AND     1 PRECEDING) 
        AS PRIOR_ROW_VALUE,           
	-- get value from next row --
        MAX  (S1.VALUE) 
	OVER (PARTITION BY 1 
	      ORDER BY S1.TRADING_PERIOD 
	      ROWS BETWEEN 1 FOLLOWING 
	           AND     1 FOLLOWING) 
	AS NEXT_ROW_VALUE,             
        -- get cumulative running total --
        SUM  (S1.VALUE) 
	OVER (PARTITION BY 1 
	      ORDER BY S1.TRADING_PERIOD 
	      ROWS BETWEEN UNBOUNDED PRECEDING 
	      AND CURRENT ROW) 
	AS RUNNING_TOTAL,
        -- get cumulative total remaining --
        SUM  (S1.VALUE) 
	OVER (PARTITION BY 1 
	      ORDER BY S1.TRADING_PERIOD 
	      ROWS BETWEEN CURRENT ROW 
	      AND  UNBOUNDED FOLLOWING) 
	AS TOTAL_REMAINING,
        -- get running daily total --
        SUM  (S1.VALUE) 
	OVER (PARTITION BY S1.TRADING_DATE 
	      ORDER BY S1.TRADING_PERIOD 
	      ROWS BETWEEN UNBOUNDED PRECEDING 
	      AND CURRENT ROW) AS DAILY_RUNNING_TOTAL,
        -- get running daily total remaining --
        SUM  (S1.VALUE) 
	OVER (PARTITION BY S1.TRADING_DATE 
	      ORDER BY S1.TRADING_PERIOD 
	      ROWS BETWEEN CURRENT ROW 
	      AND UNBOUNDED FOLLOWING) AS DAILY_TOTAL_REMAINING,
        -- get moving average over 5 trading period -- 
        ROUND (AVG (VALUE) 
	       OVER (PARTITION BY 1 
		     ORDER BY S1.TRADING_PERIOD 
		     ROWS BETWEEN 5 PRECEDING 
		     AND CURRENT ROW), 
	       2) 
	AS MOVING_AVERAGE
FROM    M01_BASE_DATA S1 -- call M01_BASE_DATA and give it the alias S1;
