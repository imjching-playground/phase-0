# Die Class 2: Arbitrary Symbols


# I worked on this challenge by myself.
# I spent 0.33 hours on this challenge.

# Pseudocode

# Input: the input of #initialize is an array containing any number of strings.
# Output: the output of #roll is a string chosen randomly from the strings in the input array.
# Steps:

# CREATE Die class with three methods:
#   initialize, which takes an array called "labels" as its argument
#     SET instance variable "@sides" equal to "labels"
#     RAISE error if "labels" is an empty array

#   sides
#     RETURN length of "labels"

#   roll
#     SELECT a random number between 0 and one less than "sides"
#     AND RETURN the item at the corresponding index in "labels"



# Initial Solution

class Die
  def initialize(labels)
    @sides = labels

    raise ArgumentError.new("Array must contain at least one value.") if labels.empty?
  end

  def sides
    @sides.length
  end

  def roll
    @sides[rand(sides)]
  end
end


# Refactored Solution

# => Hmm... I don't know if this can be refactored further.


# Reflection

# What were the main differences between this die class and the last one you created in terms of implementation? Did you need to change much logic to get this to work?
# => The logic was the same. I just had to convert between the face values of the die and the index numbers.

# What does this exercise teach you about making code that is easily changeable or modifiable?
# => Make things as flexible (= abstract) as possible the first time, so you won't have to change as much.

# What new methods did you learn when working on this challenge, if any?
# => None, though I had to refresh my memory on the ArgumentError class from the last Die challenge.

# What concepts about classes were you able to solidify in this challenge?
# => Nothing, I'm already comfortable with these concepts.