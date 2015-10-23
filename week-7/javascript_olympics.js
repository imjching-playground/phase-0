 // JavaScript Olympics

// I paired with Deanna Warren on this challenge.

// This challenge took us 1 hour.


// Bulk Up

function win(array)  {
  for (var i = 0; i < array.length; i++) {
    array[i].win = console.log(array[i].name + " won the " + array[i].event);
  }
}

// Jumble your words

function backwards(word) {
  console.log(word.split("").reverse().join(""));
}

// 2,4,6,8

function evenNumbers(array) {
  return array.filter(isEven);
}

function isEven(integer) {
  return integer % 2 === 0;
}

// "We built this city"

function Athlete(name, age, sport, quote) {
  this.name = name;
  this.age = age;
  this.sport = sport;
  this.quote = quote;
}

// DRIVER CODE
var michaelPhelps = new Athlete("Michael Phelps", 29, "swimming", "It's medicinal I swear!");
console.log(michaelPhelps.constructor === Athlete);
console.log(michaelPhelps.name + ", " + michaelPhelps.sport + ": " + michaelPhelps.quote);

// Reflection

// What JavaScript knowledge did you solidify in this challenge?
//   Good refresher on constructor functions. I also learned about the filter()
//   method.

// What are constructor functions?
//   Constructor functions create a template and means of instantiating objects
//   with the same sets of properties.

// How are constructors different from Ruby classes (in your research)?
//   Constructors and classes handle inheritance differently. Ruby classes exist
//   in a hierarchy, where child classes inherit characteristics from parent
//   and other ancestor classes. JavaScript handles inheritance through
//   "prototypes", meaning you have to create a constructor as a prototype of
//   the object type you want it to inherit from.