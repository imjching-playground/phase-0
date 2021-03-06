/*
Create a new list
DEFINE a function "make_list()" that takes no argument
  ASSIGN a global variable "grocery_list"
  AND set value of grocery_list to an empty object

Add an item with a quantity to the list
DEFINE a function "add()" that takes two arguments (a string: "item_name"; an integer: "item_qty")
  SET value of grocery_list property item_name to item_qty

Remove an item from the list
DEFINE a function "remove()" that takes one argument (a string: "item_name")
  DELETE item_name property from grocery_list

Update quantities for items in your list
DEFINE function "update()" that takes two arguments (a string: "item_name";
  a positive/negative integer: "qty_change")
  INCREMENT value of grocery_list property item_name by qty_change

Print the list (Consider how to make it look nice!)
DEFINE a function "print_list()" that takes no argument
  PRINT grocery_list to console
*/

function make_list() {
  grocery_list = {};
}

function add(item_name, item_qty) {
  grocery_list[item_name] = item_qty;
}

function remove(item_name) {
  delete grocery_list[item_name];
}

function update(item_name, qty_change) {
  grocery_list[item_name] += qty_change;
}

function print_list() {
  console.log(grocery_list);
}

// Test code

make_list();
console.log("Empty list:", grocery_list);

add("bananas", 10);
add("apples", 5);
console.log("10 bananas, 5 apples added:", grocery_list);

remove("apples");
console.log("apples removed:", grocery_list);

update("bananas", -5);
console.log("subtracted 5 bananas:", grocery_list);

print_list();

/*
===============================================================================
Reflection
===============================================================================
What concepts did you solidify in working on this challenge? (reviewing the
passing of information, objects, constructors, etc.)
  I found it pretty easy. I could add functionality, but for the purpose of
  the challenge I think the code is clean and would not gain anything from
  refactoring.

What was the most difficult part of this challenge?
  Without creating a DOM, it is hard to create a nice print function. That
  doesn't really matter, since no one really uses JS without a DOM in the real
  world.

Did an array or object make more sense to use and why?
  I used an object so that I could have item names as property and quantities
  as values.
*/