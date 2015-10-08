# Calculate the Median!

# Complete each step below according to the challenge directions and
# include it in this file. Also make sure everything that isn't code
# is commented in the file.

# I worked on this challenge by myself.

# 0. Pseudocode

# What is the input?
# => Part I: an array of numbers (can include floats, integers, negatives)
# => Part II: an array of strings

# What is the output? (i.e. What should the code return?)
# => Part I: a number. Might be complications from string/float mixing.
# => Part II: a string

# What are the steps needed to solve the problem?
# Part I:
# SORT array
# IF array has odd number of elements
# => RETURN middle element
# IF array has even number of elements
# => RETURN average of middle two elements

# Part II:
# Same as above.

# 1. Initial Solution

def median(arr)
  arr.sort!
  if arr.length.odd?
    mid_idx = arr.length / 2
    return arr[mid_idx]
  else
    mid_idx_1 = arr.length / 2
    mid_idx_2 = mid_idx_1 - 1
    mid_avg = (arr[mid_idx_1].to_f + arr[mid_idx_2].to_f) / 2
    return mid_avg
  end
end

# 3. Refactored Solution

def median(arr)
  arr.sort!

  return arr[arr.length / 2] if arr.length.odd?

  (arr[arr.length / 2].to_f + arr[arr.length / 2 - 1].to_f) / 2
end


# 4. Reflection
