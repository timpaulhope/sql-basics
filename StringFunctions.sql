/*
  Purpose: This query demonstrates various string manipulation functions.
  Author: TH
  Date: 202309
*/

SELECT
  -- Provide a static text string that says Hello World
  'Hello World' AS static_text,

  -- Convert the text to upper case
  UPPER('Hello World') AS upper_case,

  -- Convert the text to lower case
  LOWER('Hello World') AS lower_case,

  -- Tell me how many characters there are in a string
  LENGTH('Hello World') AS character_count,

  -- Return all characters to the right of the 7th character in a string
  SUBSTR('Hello World', 7) AS right_of_7th_char,

  -- Starting from the left, return the first 5 characters in a string
  SUBSTR('Hello World', 1, 5) AS left_5_chars,

  -- Starting from the right, return the last 3 characters in a string
  SUBSTR('Hello World', -3) AS last_3_chars,

  -- Return the 2 characters to the right of the 4th character in a string
  SUBSTR('Hello World', 4, 2) AS chars_4_to_5,

  -- Return the 2 characters to the left of the 4th character from the end of a string
  SUBSTR('Hello World', -4, 2) AS chars_before_4th_from_end,

  -- Tell me the position where the letter W occurs in the string
  INSTR('Hello World', 'W') AS position_of_W,

  -- Starting from the first 'o', give me the next 3 letters
  SUBSTR('Hello World', INSTR('Hello World', 'o'), 3) AS next_3_chars_after_first_o,

  -- Trim off any spaces at the start and end of a string
  TRIM('    Hello World  ') AS trimmed_text,

  -- Trim off any numbers from the start of a string
  LTRIM('2013Hello World2013', '0123456789') AS left_trimmed_text,

  -- Trim off any numbers from the end of a string
  RTRIM('2013Hello World2013', '0123456789') AS right_trimmed_text,

  -- Replace all the 'l's in a string with a # symbol
  REPLACE('Hello World', 'l', '#') AS replaced_text,

  -- Remove all the 'l's in a string
  REPLACE('Hello World', 'l') AS removed_l,

  -- Change all occurrences of a character in a string to another value
  TRANSLATE('Hello World', 'elo', '3LQ') AS translated_text,

  -- Concatenate multiple strings together using ||
  'Hello ' || 'World' AS concatenated_text,

  -- Concatenate two strings together using the CONCAT function
  CONCAT('Hello ', 'World') AS concatenated_with_function,

  -- Add '#' to the left of a string to make the total length equal 13 characters
  LPAD('Hello World', 13, '#') AS left_padded_text,

  -- Add '#' to the right of a string to make the total length equal 13 characters
  RPAD('Hello World', 13, '#') AS right_padded_text
FROM DUAL;
