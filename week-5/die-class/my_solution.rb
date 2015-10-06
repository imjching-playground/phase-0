# Die Class 1: Numeric

# I worked on this challenge [by myself, with: ]

# I spent [] hours on this challenge.

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
    @sides = sides
      raise ArgumentError.new("Must have at least 1 side") if sides < 1
  end

  def sides
    @sides
  end

  def roll
    rand(@sides) + 1
  end
end

# 3. Refactored Solution







# 4. Reflection