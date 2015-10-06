# Die Class 1: Numeric

# I worked on this challenge [by myself, with: ]

# I spent 0.75 hours on this challenge.

# 0. Pseudocode

# Input: integer
# Output: integer between 1 and input (inclusive)
# Steps:
# CREATE "sides" (var) and set equal to number of sides
# RETURN "sides" (var) with "sides" (method)
# RETURN number between 1 and "sides" (inclusive) with "roll" (method)


# 1. Initial Solution

class Die
  def initialize(sides)
    raise ArgumentError.new("Must have at least 1 side") if sides < 1
    @sides = sides
  end

  def sides
    @sides
  end

  def roll
    rand(@sides) + 1
  end
end

# 3. Refactored Solution

# The code is already simple, DRY, and legible. I don't think it can be refactored further. I am not sure how an enumerable would help here.


# 4. Reflection

# What is an ArgumentError and why would you use one?
# => ArgumentError should be raised when a class or method receives an invalid argument as one of its parameters. 
# => For example, giving a die negative sides. I'm not sure if a 1-sided die is even valid, but that's what the
# => direction said...

# What new Ruby methods did you implement? What challenges and successes did you have in implementing them?
# => I did not use any new Ruby methods. The only method I used was :rand (besides :initialize, :sides, and :roll), 
# => which I have used before.

# What is a Ruby class?
# => Classes are "factories" for building objects. The class definition allows you to define the properties (= variables)
# => and abilities (= methods) of instances of that class.

# Why would you use a Ruby class?
# => If you want to do anything in Ruby, you will probably use classes. All objects in Ruby belong to a class and, since Ruby
# => is a highly object-oriented language, that means you will be dealing with instances of classes. You would have to create
# => a new class if you want to create a new type of object. You might modify an existing class if you wanted to change its 
# => variables or methods.

# What is the difference between a local variable and an instance variable?
# => A local variable is accessible only to other objects and methods within its scope. For example, if I used a local variable 
# => "sides" on line 22, it would not be accessible to my :sides and :roll methods below (that would be bad). An instance
# => variable (like @sides) is declared in the class definition and is copied over to each new instance of that class. Any
# => changes made to the object's instance variable don't affect other objects (instances) of that class.

# Where can an instance variable be used?
# => In a class definition.