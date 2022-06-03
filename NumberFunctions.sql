SELECT
        /*Adding two numbers together*/
        2 + 1,
        /*Subtracting one number from another*/
        2 - 1,
        /*Multiplying two numbers*/
        2 * 2,
        /*dividing one number by another*/
        2 / 2,
        /*Return the absolute (postive) value for a number*/
        ABS ( - 3.141915),
        /*Round a value to the nearest whole number*/
        ROUND ( - 3.141915),
        /*Round a value to the nearest 1 decimal place*/
        ROUND ( - 3.141915, 1),
        /*truncate (remove) a the decimal numbers without rounding*/
        TRUNC (3.141915),
        /*truncate (remove) a the decimal numbers to the first decimal place without rounding*/
        TRUNC (3.141915, 1),
        /*return the smallest whole number value that is greater than or equal to a number*/
        CEIL (3.141915),
        /*return the smallest whole number that is less than or equal to a number*/
        FLOOR (3.141915),
        /*return the largest value in a list*/
        GREATEST (2, 1, 52, 20),
        /*return the smallest value in a list*/
        LEAST (2, 1, 52, 20)
FROM    DUAL; 
