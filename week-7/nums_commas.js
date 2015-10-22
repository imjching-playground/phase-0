// Separate Numbers with Commas in JavaScript **Pairing Challenge**


// I worked on this challenge with: David Roberts.

// Pseudocode
// INPUT: a positive integer
// OUTPUT: a string (number with commas)

// DEFINE a function called separateComma that takes a single argument (integer called int)
//    ASSIGN a variable intString to string version of int
//    ASSIGN a variable rIntString to an empty string
//    FOR LOOP i = 0 through length of intString, incrementing by 1
//      SET rIntString equal to  index i of intString + rIntString
//    ASSIGN rCommaString to empty string
//    FOR LOOP i = 0 through length of rIntString, incrementing by 3
//      SET rCommaString equal to rCommaString + SLICE rIntString from index i to index i+2
//      IF length of rIntString minus i is greater than 1
//      SET rCommaString equal to rCommaString + ","
//    ASSIGN a variable commaString to an empty string
//    FOR LOOP i = 0 through length of rCommaString, incrementing by 1
//      SET commaString equal to index i of rCommaString + commaString
//    RETURN commaString


// Initial Solution

// var separateComma = function(int) {
//   var intString = String(int);

//   // reverse string
//   var rIntString = "";
//   for (var i = 0; i < intString.length; i++) {
//     rIntString = intString.charAt(i) + rIntString;
//   };

//   // add commas
//   var rCommaString = "";
//   for (i = 0; i < rIntString.length; i += 3) {
//     rCommaString = rCommaString + rIntString.slice(i, (i+3));
//     if (rIntString.length - i > 3) {
//       rCommaString = rCommaString + ",";
//     };
//   };

//   // reverse again
//   var commaString = "";
//   for (i = 0; i < rCommaString.length; i++) {
//     commaString = rCommaString.charAt(i) + commaString;
//   };

//   console.log(commaString);
// };


// Refactored Solution

var separateComma = function(int) {

  var reverseString = function(string) {
    var reversed = "";
    for (var i = 0; i < string.length; i++) {
      reversed = string.charAt(i) + reversed;
    }
    return reversed;
  };

  // convert to string and reverse
  var rIntString = reverseString(String(int));

  // add commas after every third digit
  var rCommaString = "";
  for (var i = 0; i < rIntString.length; i += 3) {
    rCommaString = rCommaString + rIntString.slice(i, (i+3));
    if (rIntString.length - i > 3) {
      rCommaString = rCommaString + ",";
    }
  }

  // reverse again
  return reverseString(rCommaString);
};



// Your Own Tests (OPTIONAL)
function assert(test, message, test_number) {
  if (!test) {
    console.log(test_number + "false");
    throw "ERROR: " + message;
  }
  console.log(test_number + "true");
  return true;
}

assert((separateComma(1) === "1"), "Should be 1", "1: ");
assert((separateComma(12) === "12"), "Should be 12", "2: ");
assert((separateComma(555) === "555"), "Should be 555", "3: ");
assert((separateComma(1000) === "1,000"), "Should be 1,000", "4: ");
assert((separateComma(10000) === "10,000"), "Should be 10,000", "5: ");
assert((separateComma(123123) === "123,123"), "Should be 123,123", "6: ");
assert((separateComma(999000999) === "999,000,999"), "Should be 999,000,999", "7: ");


// Reflection
// What was it like to approach the problem from the perspective of JavaScript? Did you approach the problem differently?
//   It felt very primitive to use so many for-loops instead of enumerables.
//   JavaScript's slice() method allowed us to use a similar approach to my
//   Ruby solution, which used #each_slice.

// What did you learn about iterating over arrays in JavaScript?
//   We did not use arrays for the problem. Iterating through strings is
//   similar in both languages, but JavaScript you use charAt() to return a
//   value at a string index.

// What was different about solving this problem in JavaScript?
//   Fewer methods available. We were heavily reliant on for-loops.

// What built-in methods did you find to incorporate in your refactored solution?
//   We did not find any useful methods for refactoring. We refactored by
//   defining a new function to reverse a string.