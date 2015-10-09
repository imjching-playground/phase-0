# Pad an Array

# I worked on this challenge with: Peter Wiebe.

# I spent 1.25 hours on this challenge.


# Complete each step below according to the challenge directions and
# include it in this file. Also make sure everything that isn't code
# is commented in the file.



# 0. Pseudocode

# What is the input?
#   an array, integer, and (optionally) a third value of any type

# What is the output? (i.e. What should the code return?)
#   an array

# What are the steps needed to solve the problem?
# DEFINE method "pad" that takes as its arguments an array, a non-negative integer ("min_size"), and an optional argument ("value") with default value of "nil" with which to "pad" the array.
# IF length of array is greater or equal to min_size
#   RETURN array
# ELSE IF length of array is less than min_size
#   ASSIGN variable "index" equal to array length
#   WHILE "index" is less than min_size
#     SET value at array index "index" equal to "value" input
#     index += 1
#   END
# END
# RETURN array

# # 1. Initial Solution
def pad!(array, min_size, value = nil) #destructive
  if array.length >= min_size
    return array
  else
    index = array.length
    while index < min_size
      array[index] = value
      index += 1
    end
  end
  return array
end

def pad(arr, min_size, value = nil) #non-destructive
  array = arr.dup
  if array.length >= min_size
    return array
  else
    index = array.length
    while index < min_size
      array[index] = value
      index += 1
    end
  end
  return array
end

# 3. Refactored Solution
def pad!(array, min_size, value = nil) #destructive
  padding_amt = min_size - array.length
  padding_amt.times { array << value } if array.length < min_size
  array
end

def pad(arr, min_size, value = nil) #non-destructive
  array = arr.dup
  padding_amt = min_size - array.length
  padding_amt.times { array << value } if array.length < min_size
  array
end

# 4. Reflection

# Were you successful in breaking the problem down into small steps?
# => Yes.

# Once you had written your pseudocode, were you able to easily translate it into code? What difficulties and successes did you have?
# => It was fairly straightforward because we structured our pseudocode
# => in a way that mirrored the actual code. We were surprised when we
# => realized we had unintentionally coded the destructive method first,
# => because we thought we were making the non-destructive one.

# Was your initial solution successful at passing the tests? If so, why do you think that is? If not, what were the errors you encountered and what did you do to resolve them?
# => Yes, the initial solution passed the tests. We introduced some bugs
# => while refactoring, though. We removed the wrong part of a conditional
# => and ended up with the wrong inequality operator. Also wrote a
# => subtraction operation backwards.

# When you refactored, did you find any existing methods in Ruby to clean up your code?
# => We used methods that we already knew.

# How readable is your solution? Did you and your pair choose descriptive variable names?
# => I think it's readable, if you are familiar with the methods and
# => syntax we used. We made a conscious decision not to condense it further,
# => even though it was possible to reduce by at least one more line.

# What is the difference between destructive and non-destructive methods in your own words?
# => Destructive methods alter the input object. Non-destructive methods make
# => a copy of the input object and then do something to the copy without
# => altering the original.