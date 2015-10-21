/*

SUM ___________________________________________________________________________

DEFINE a function called "sum()" that takes one parameter "integer_array" (an
array of integers)
  ASSIGN a local variable "total" and set it equal to 0
  (FOR...IN... loop:)
  FOR (EACH) index IN "integer_array"
    ADD the value at that index in "integer_array" to "total"
  RETURN "total"
END


MEAN___________________________________________________________________________

DEFINE a function called "mean()" that takes one parameter "integer_array"
  ASSIGN a local variable "total" and set it equal to the result of calling
  function "sum()" on "integer_array"
  RETURN the result of dividing "total" by the length of "integer_array"
END


MEDIAN_________________________________________________________________________

DEFINE a function called "median()" that takes one parameter "integer_array"
  IF length of "integer_array" is divisible by two (i.e. even)
    ASSIGN a local variable "middle_two" to an empty array
    DIVIDE length of "integer_array" by 2 and push the value at that index to
    "middle_two"
    DIVIDE length of "integer_array" by 2, then subtract 1, and push the value
    at that index to "middle_two"
    RETURN the result of calling function "mean()" on "middle_two"
  ELSE (i.e. odd)
    ASSIGN local variable "middle_index" to length of "integer_array"
    minus 1, divided by two
    RETURN value in "integer_array" at index "middle_index"

*/