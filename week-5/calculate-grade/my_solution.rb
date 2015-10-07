# Calculate a letter grade!

# Complete each step below according to the challenge directions and
# include it in this file. Also make sure everything that isn't code
# is commented in the file.

# I worked on this challenge by myself.

# 0. Pseudocode

# What is the input?
# => an array of integers with possible values 0 - 100

# What is the output? (i.e. What should the code return?)
# => a string with possible values "A", "B", "C", "D", and "F"

# What are the steps needed to solve the problem?
# SET "sum" equal to sum of array elements
# SET "average" equal to sum divided by number of elements
# IF average >= 90
# => RETURN "A"
# ELSE IF average >= 80
# => RETURN "B"
# ELSE IF average >= 70
# => RETURN "C"
# ELSE IF average >= 60
# => RETURN "D"
# ELSE
# => RETURN "F"

# 1. Initial Solution
def get_grade(arr)
  sum = arr.inject(:+)
  average = sum / arr.length

  return "A" if average >= 90
  return "B" if average >= 80
  return "C" if average >= 70
  return "D" if average >= 60
  return "F"
end

# 3. Refactored Solution
def get_grade(arr)
  average = arr.inject(:+) / arr.length

  return "A" if average >= 90
  return "B" if average >= 80
  return "C" if average >= 70
  return "D" if average >= 60
  return "F"
end


# 4. Reflection
# No reflection, I guess! Pretty straightforward, since we did it last week in pairs. I did it a little more concisely this time.