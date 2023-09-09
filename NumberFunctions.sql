/*
  Purpose: This code demonstrates various mathematical and comparison functions.
  Author: TH
  Date: 303209
*/

SELECT
  -- Add two numbers together
  2 + 1 AS addition_result,

  -- Subtract one number from another
  2 - 1 AS subtraction_result,

  -- Multiply two numbers
  2 * 2 AS multiplication_result,

  -- Divide one number by another
  2 / 2 AS division_result,

  -- Return the absolute (positive) value for a number
  ABS(-3.141915) AS absolute_value,

  -- Round a value to the nearest whole number
  ROUND(-3.141915) AS rounded_whole_number,

  -- Round a value to the nearest 1 decimal place
  ROUND(-3.141915, 1) AS rounded_decimal_place_1,

  -- Truncate (remove) decimal numbers without rounding
  TRUNC(3.141915) AS truncated_whole_number,

  -- Truncate (remove) decimal numbers to the first decimal place without rounding
  TRUNC(3.141915, 1) AS truncated_decimal_place_1,

  -- Return the smallest whole number value that is greater than or equal to a number
  CEIL(3.141915) AS smallest_greater_or_equal,

  -- Return the smallest whole number that is less than or equal to a number
  FLOOR(3.141915) AS smallest_less_or_equal,

  -- Return the largest value in a list
  GREATEST(2, 1, 52, 20) AS largest_value,

  -- Return the smallest value in a list
  LEAST(2, 1, 52, 20) AS smallest_value,

  -- Calculate the modulus (remainder) of two numbers
  MOD(10, 3) AS modulus_result
FROM DUAL;
