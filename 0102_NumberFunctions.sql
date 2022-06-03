SELECT  2 + 1,                   -- add two numbers together
        2 - 1,                   -- subtract one number from another
        2 * 2,                   -- multiply two numbers
        2 / 2,                   -- dividing one number by another
        ABS ( - 3.141915),       -- return the absolute (postive) value for a number 
        ROUND ( - 3.141915),     -- round a value to the nearest whole number
        ROUND ( - 3.141915, 1),  -- round a value to the nearest 1 decimal place
        TRUNC (3.141915),        -- truncate (remove) a the decimal numbers without rounding
        TRUNC (3.141915, 1),     -- truncate (remove) a the decimal numbers to the first decimal place without rounding 
        CEIL (3.141915),         -- return the smallest whole number value that is greater than or equal to a number
        FLOOR (3.141915),        -- return the smallest whole number that is less than or equal to a number
        GREATEST (2, 1, 52, 20), -- return the largest value in a list
        LEAST (2, 1, 52, 20)     -- return the smallest value in a list
FROM    DUAL; 
