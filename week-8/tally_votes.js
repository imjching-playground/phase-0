// Tally Votes in JavaScript Pairing Challenge.

// I worked on this challenge with Jeremy Powell:
// This challenge took me 3 hours.

// These are the votes cast by each student. Do not alter these objects here.
var votes = {
  "Alex": { president: "Bob", vicePresident: "Devin", secretary: "Gail", treasurer: "Kerry" },
  "Bob": { president: "Mary", vicePresident: "Hermann", secretary: "Fred", treasurer: "Ivy" },
  "Cindy": { president: "Cindy", vicePresident: "Hermann", secretary: "Bob", treasurer: "Bob" },
  "Devin": { president: "Louise", vicePresident: "John", secretary: "Bob", treasurer: "Fred" },
  "Ernest": { president: "Fred", vicePresident: "Hermann", secretary: "Fred", treasurer: "Ivy" },
  "Fred": { president: "Louise", vicePresident: "Alex", secretary: "Ivy", treasurer: "Ivy" },
  "Gail": { president: "Fred", vicePresident: "Alex", secretary: "Ivy", treasurer: "Bob" },
  "Hermann": { president: "Ivy", vicePresident: "Kerry", secretary: "Fred", treasurer: "Ivy" },
  "Ivy": { president: "Louise", vicePresident: "Hermann", secretary: "Fred", treasurer: "Gail" },
  "John": { president: "Louise", vicePresident: "Hermann", secretary: "Fred", treasurer: "Kerry" },
  "Kerry": { president: "Fred", vicePresident: "Mary", secretary: "Fred", treasurer: "Ivy" },
  "Louise": { president: "Nate", vicePresident: "Alex", secretary: "Mary", treasurer: "Ivy" },
  "Mary": { president: "Louise", vicePresident: "Oscar", secretary: "Nate", treasurer: "Ivy" },
  "Nate": { president: "Oscar", vicePresident: "Hermann", secretary: "Fred", treasurer: "Tracy" },
  "Oscar": { president: "Paulina", vicePresident: "Nate", secretary: "Fred", treasurer: "Ivy" },
  "Paulina": { president: "Louise", vicePresident: "Bob", secretary: "Devin", treasurer: "Ivy" },
  "Quintin": { president: "Fred", vicePresident: "Hermann", secretary: "Fred", treasurer: "Bob" },
  "Romanda": { president: "Louise", vicePresident: "Steve", secretary: "Fred", treasurer: "Ivy" },
  "Steve": { president: "Tracy", vicePresident: "Kerry", secretary: "Oscar", treasurer: "Xavier" },
  "Tracy": { president: "Louise", vicePresident: "Hermann", secretary: "Fred", treasurer: "Ivy" },
  "Ullyses": { president: "Louise", vicePresident: "Hermann", secretary: "Ivy", treasurer: "Bob" },
  "Valorie": { president: "Wesley", vicePresident: "Bob", secretary: "Alex", treasurer: "Ivy" },
  "Wesley": { president: "Bob", vicePresident: "Yvonne", secretary: "Valorie", treasurer: "Ivy" },
  "Xavier": { president: "Steve", vicePresident: "Hermann", secretary: "Fred", treasurer: "Ivy" },
  "Yvonne": { president: "Bob", vicePresident: "Zane", secretary: "Fred", treasurer: "Hermann" },
  "Zane": { president: "Louise", vicePresident: "Hermann", secretary: "Fred", treasurer: "Mary" }
};

// Tally the votes in voteCount.
var voteCount = {
  president: {},
  vicePresident: {},
  secretary: {},
  treasurer: {}
};

/* The name of each student receiving a vote for an office should become a property
of the respective office in voteCount.  After Alex's votes have been tallied,
voteCount would be ...
  var voteCount = {
    president: { Bob: 1 },
    vicePresident: { Devin: 1 },
    secretary: { Gail: 1 },
    treasurer: { Kerry: 1 }
  }
*/


/* Once the votes have been tallied, assign each officer position the name of the
student who received the most votes. */
var officers = {
  president: undefined,
  vicePresident: undefined,
  secretary: undefined,
  treasurer: undefined
};

// Pseudocode

// for each person in votes
//   //check president
//   assign variable prezVote to - access president property(in vote object) and
//   if prezVote property of president in voteCount for exists- increment 1
//   else set prezVote property of president in voteCount with value 1

//   //check VP
//   assign variable vpVote to - access vicePresident property(in vote object) and
//   if vpVote property of vicePresident in voteCount for exists- increment 1
//   else set vpVote property of vicePresident in voteCount with value 1

//   //check secretary
//   assign variable secretaryVote to - access secretary property(in vote object) and
//   if secretaryVote property of secretary in voteCount for exists- increment 1
//   else set secretaryVote property of secretary in voteCount with value 1

//   //check treasurer
//   assign variable tresVote to - access treasurer property(in vote object) and
//   if tresVote property of treasurer in voteCount for exists- increment 1
//   else set tresVote property of treasurer in voteCount with value 1


// __________________________________________
// Initial Solution

//   function tally(voteList){
//     for (var voter in voteList){
//       // console.log(voter);
//       for (var office in voteList[voter]){
//         // console.log(office);
//         var votedFor = voteList[voter][office]
//         if (voteCount[office][votedFor]){
//           voteCount[office][votedFor] += 1;
//         }
//         else {
//           voteCount[office][votedFor] = 1;
//         }
//       }
//     }
//     return voteCount;
//   };
//   // var answer = console.log(tally(voteList));
//   // answer;

//   function elect(voteList){
//     for (var office in voteList){
//       var max = 0;
//       for (var candidate in voteList[office]){
//         if (voteList[office][candidate] > max){
//           max = voteList[office][candidate];
//         }
//       }

//       var winner;
//       for (var candidate in voteList[office]){
//         if (voteList[office][candidate] === max){
//           winner = candidate;
//           // console.log(winner, office);
//           officers[office] = winner;
//         }
//       }
//     }
//     return officers;
//   };
// // console.log(elect(tally(votes)));
// // console.log(elect(answer));
// tally(votes);
// console.log(elect(tally(votes)));


// __________________________________________
// Refactored Solution

// calculate all votes by candidate and office
for (var voter in votes){
  for (var office in votes[voter]){
    var votedFor = votes[voter][office];
    if (voteCount[office][votedFor]){
      voteCount[office][votedFor] += 1;
    }
    else {
      voteCount[office][votedFor] = 1;
    }
  }
}
// calculate top voted candidate
for (var office in voteCount){
  // calculate max vote for each office
  var max = 0;
  for (var candidate in voteCount[office]){
    if (voteCount[office][candidate] > max){
      max = voteCount[office][candidate];
    }
  }
  // find candidate with max votes in each office
  for (candidate in voteCount[office]){
    if (voteCount[office][candidate] === max){
      officers[office] = candidate;
    }
  }
}

// __________________________________________
// Reflection

// What did you learn about iterating over nested objects in JavaScript?
//   It's very helpful to give each nesting level a descriptive variable name
//   to reduce the length of code needed to reference that element in the
//   parent object.

// Were you able to find useful methods to help you with this?
//   No, we essentially used a lot of for..in... loops. We considered replacing
//   the middle loop by using the Math.max method, but in order to get the
//   array of numbers for Math.max, we would have had to loop through the object
//   to get the values, so it seemed pointless to replace one for loop with
//   another.

// What concepts were solidified in the process of working through this challenge?
//   It helped solidify the situations where bracket notation is required.



// __________________________________________
// Test Code:  Do not alter code below this line.


function assert(test, message, test_number) {
  if (!test) {
    console.log(test_number + "false");
    throw "ERROR: " + message;
  }
  console.log(test_number + "true");
  return true;
}

assert(
  (voteCount.president["Bob"] === 3),
  "Bob should receive three votes for President.",
  "1. "
)

assert(
  (voteCount.vicePresident["Bob"] === 2),
  "Bob should receive two votes for Vice President.",
  "2. "
)

assert(
  (voteCount.secretary["Bob"] === 2),
  "Bob should receive two votes for Secretary.",
  "3. "
)

assert(
  (voteCount.treasurer["Bob"] === 4),
  "Bob should receive four votes for Treasurer.",
  "4. "
)

assert(
  (officers.president === "Louise"),
  "Louise should be elected President.",
  "5. "
)

assert(
  (officers.vicePresident === "Hermann"),
  "Hermann should be elected Vice President.",
  "6. "
)

assert(
  (officers.secretary === "Fred"),
  "Fred should be elected Secretary.",
  "7. "
)

assert(
  (officers.treasurer === "Ivy"),
  "Ivy should be elected Treasurer.",
  "8. "
)