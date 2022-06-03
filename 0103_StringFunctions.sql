SELECT  'Hello World',                   -- give me a static text string that says Hello World
        UPPER ('Hello World'),           -- convert the text to upper case
        LOWER ('Hello World'),           -- convert the text to lower case
        LENGTH ('Hello World'),          -- tell me how many characters there are in a string
        SUBSTR ('Hello World', 7),       -- return all character to the right of the 7th character in a string
        SUBSTR ('Hello World', 0, 5),    -- starting from the left, return the first 5 characters in a string
        SUBSTR ('Hello World', - 3),     -- starting from the right, return the last 3 characters in a string
        SUBSTR ('Hello World', 4, 2),    -- return the 2 characters to the right of the 4th character in a string
        SUBSTR ('Hello World', - 4, 2),  -- return the 2 characters to the left of the 4th character from the end of a string
        INSTR ('Hello World', 'W'),      -- tell me what position the letter W occurs in the string
        SUBSTR ('Hello World', 
                INSTR ('Hello World', 'o'), 
                3),                      -- starting from the first 'o', give me the next 3 letters
        TRIM ('    Hello World  '),      -- trim off any spaces at the start and end of a string
        LTRIM ('2013Hello World2013', 
               '0123456789'),            -- trim off any numbers from the start of a string
        RTRIM ('2013Hello World2013', 
               '0123456789'),            -- trim off any numbers from the end of a string
        REPLACE ('Hello World', 
                 'l', '#'),              -- replace all the 'l's in a string with a # symbol
        REPLACE ('Hello World', 'l'),    -- remove all the 'l's in a string
        TRANSLATE ('Hello World', 
                   'elo', '3LQ'),        -- change all occurances of a character in a string to another value
        'Hello ' || 'World',             -- concatenate multiple strings together using ||
        CONCAT ('Hello ', 'World'),      -- concatenate two strings together using the concat function
        LPAD ('Hello World', 13, '#'),   -- add '#' to the left of a string so that the total length equals 13 characters
        RPAD ('Hello World', 13, '#')    -- add '#' to the right of a string so that the total length equals 13 characters
FROM    DUAL;

/* == EoF ==*/
