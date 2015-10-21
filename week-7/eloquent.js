// Eloquent JavaScript

// Run this file in your terminal using `node my_solution.js`. Make sure it works before moving on!

// Program Structure
// Write your own variable and do something to it.
var foo = 5;
foo++;

// Favorite Food
var favFood = prompt("What's your favorite food?")
console.log("Hey! That's my favorite too!")



// Complete one of the exercises: Looping a Triangle, FizzBuzz, or Chess Board

// Chess Board

for (row = 0; row < 8; row++) {
    if (row % 2 === 0) {
        console.log(" # # # #");
    }
    else {
        console.log("# # # # ");
    }
}


// Functions

// Complete the `minimum` exercise.
function min(x, y) {
    if (x < y) {
        return x;
    }
    else {
        return y;
    }
}


// Data Structures: Objects and Arrays
// Create an object called "me" that stores your name, age, 3 favorite foods, and a quirk below.

me = {
    name: "Steven",
    age: 29,
    favFoods: ["shabu shabu", "sushi", "spaghetti"],
    quirk: "bad tree-climber"
};