SELECT
        /* Give me a static text string that says Hello World */
        'Hello World',
        /* Convert text to upper case  */
        UPPER ('Hello World'),
        /* Convert text to lower case  */
        LOWER ('Hello World'),
        /* Tell me how many characters there are in a string*/
        LENGTH ('Hello World'),
        /* Return all character to the right of the 7th character in a string*/
        SUBSTR ('Hello World', 7),
        /* Starting from the left , Return the first 5 characters in a string*/
        SUBSTR ('Hello World', 0, 5),
        /* Starting from the right, Return the last 3 characters in a string*/
        SUBSTR ('Hello World', - 3),
        /* Return the 2 character to the right of the 4th character in a string*/
        SUBSTR ('Hello World', 4, 2),
        /* Return the 2 character to the left of the 4th character from the end of a string*/
        SUBSTR ('Hello World', - 4, 2),
        /* Tell me in what position the letter W occurs in the string*/
        INSTR ('Hello World', 'W'),
        /* Starting from the first o, give me the next 3 letters*/
        SUBSTR ('Hello World', INSTR ('Hello World', 'o'), 3),
        /* Trim off any spaces at the start and end of a string*/
        TRIM ('          Hello World     '),
        /* Trim off any numbers from the start of a string*/
        LTRIM ('2013Hello World2013', '0123456789'),
        /* Trim off any numbers from the end of a string*/
        RTRIM ('2013Hello World2013', '0123456789'),
        /* Replace all the ls in a string with a # symbol*/
        REPLACE ('Hello World', 'l', '#'),
        /* Remove all the ls in a string*/
        REPLACE ('Hello World', 'l'),
        /* change all occurances of a character in a string to another value*/
        TRANSLATE ('Hello World', 'elo', '3LQ'),
        /* Concatenate multiple strings together using ||*/
        'Hello ' ||
        'World',
        /* Concatenate two strings together using the concat function*/
        CONCAT ('Hello ', 'World'),
        /* Add '#' to the left of a string so that the total length equals 13 characters*/
        LPAD ('Hello World', 13, '#'),
        /* Add '#' to the right of a string so that the total length equals 13 characters*/
        RPAD ('Hello World', 13, '#')
FROM    DUAL;
