# Calculate the mode Pairing Challenge

# I worked on this challenge with: Mark Janzer.

# I spent 1.5 hours on this challenge.

# Complete each step below according to the challenge directions and
# include it in this file. Also make sure everything that isn't code
# is commented.


# 0. Pseudocode

# What is the input? Array that contains positive or negative integers or floats
# What is the output? (i.e. What should the code return?) Return an array with the most common numbers in them (more than one if there is a tie).
# What are the steps needed to solve the problem?
# DEFINE mode to take one argument (num_array)
#   Create a new hash: num_counts
#   FOR EACH number in num_array
#     IF there is a key of num in num_counts
#       Add 1 to the value of that key
#     ELSE create a key named num with value of 1
#     END
#   END
#   Set variable highest equal to first value in num_counts
#   FOR EACH value in num_counts
#     IF value > highest
#       highest = value
#     END
#   END
#   Create a solution array
#   FOR EACH value in num_counts
#      IF value = highest
#         Push the key to solution
#      END
#   END
#   RETURN solution
# END


# 1. Initial Solution

def mode(num_array)
  # calculates frequencies
  num_counts = {}
  num_array.each do |num|
    if num_counts.has_key?(num)
      num_counts[num] += 1
    else
      num_counts[num] = 1
    end
  end

  # finds the highest frequency
  highest = num_counts.values[0]
  num_counts.each do |k, v|
    if v > highest
      highest = v
    end
  end

  # checks for keys with that frequency
  solution = []
  num_counts.each do |k, v|
    if v == highest
      solution << k
    end
  end

  solution
end


# 3. Refactored Solution
def mode(num_array)
  num_counts = Hash.new(0)
  num_array.each { |n| num_counts[n] += 1 }

  solution = []
  num_counts.each {|k,v| solution << k if v == num_counts.values.max}
  solution
end


# 4. Reflection
# Which data structure did you and your pair decide to implement and why?
# => We used a hash because it allowed us to store each number and its count as linked data.

# Were you more successful breaking this problem down into implementable pseudocode than the last with a pair?
# => We didn't have any trouble writing the pseudocode. My partner had a clear idea of how to solve it and we worked together to figure out how to make that work with the tools available.

# What issues/successes did you run into when translating your pseudocode to code?
# => One issue was that we wanted to iterate through each number in the input array and incremement the value of the corresponding key in the hash. That didn't work when the hash didn't contain that key yet, because we hadn't set default values.

# What methods did you use to iterate through the content? Did you find any good ones when you were refactoring? Were they difficult to implement?
# => We mostly just used :each to iterate through the data. We used :max in the refactored solution, which saved at least one line of code. We also came up with an approach using :inject, but we borrowed the idea from a post on overstack and, even though we made it our own, we didn't feel we should include it in our code:

# This line could condense lines 74-75 to one line:
# num_counts = num_array.inject(Hash.new(0)) { |hash, n| hash[n] += 1; hash}