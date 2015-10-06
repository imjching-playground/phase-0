# Numbers to Commas Solo Challenge

# I spent [] hours on this challenge.

# Complete each step below according to the challenge directions and
# include it in this file. Also make sure everything that isn't code
# is commented in the file.

# 0. Pseudocode

# What is the input?
# => an integer

# What is the output? (i.e. What should the code return?)
# => a string

# What are the steps needed to solve the problem?
# ASSIGN variable "result" to new empty string
# ASSIGN variable "input" to the value of the integer input
# CONVERT "input" to string
# REVERSE "input"
# MOVE each digit from "input" to beginning of "result" string
# AND INSERT comma before every third insertion
# DELETE any leading comma


# 1. Initial Solution

# def separate_comma(int)

#   result = ""
#   input = int.to_s.reverse

#   i = 0
#   while i < input.length
#     result = input[i] + result
#     result = "," + result if (i + 1) % 3 == 0
#     i += 1
#   end

#   result[0] = "" if result[0] == ","

#   result

# end

# 2. Refactored Solution

def separate_comma(int)

  int = int.to_s.split(//)
  result = []

  # (moves digits over in groups of three and appends a comma after each trio)
  (int.length / 3 + 1).times { result.unshift(int.pop(3)) }
  result.each { |trio| trio << ","}

  # (removes leading comma from first trio or trailing comma from final trio)
  result[-1].delete_at(-1) if result[-1][-1] == ","
  result[0].delete_at(0) if result[0][0] == ","

  result.join

end

# 3. Reflection
# What was your process for breaking the problem down? What different approaches did you consider?
# => I first thought about how I would try to solve the problem if I were doing it in my head. I decided would start at the far right of the number and put a comma before every third digit. Then I modified that strategy to work with the limited methods available for the initial solution.

# Was your pseudocode effective in helping you build a successful initial solution?
# => Yes.

# What Ruby method(s) did you use when refactoring your solution? What difficulties did you have implementing it/them? Did it/they significantly change the way your code works? If so, how?
# => I wanted to eliminate unnecessary steps, including the variable assignment and string reversal on line 32. That led me to a slight change of strategy, so that instead of transferring each digit from the end of the string and adding a comma after every third one, I transferred chunks of three digits and put a comma after each chunk. I also wanted to avoid using a counter variable, since I know that there are usually built-in methods to avoid that in Ruby; I ended up using the :times function, but that introduced another complication. I would have liked to simplify lines 59-60, but I think it would be difficult without fundamentally changing my approach.

# How did you initially iterate through the data structure?
# => With a while loop and counter.

# Do you feel your refactored solution is more readable than your initial solution? Why?
# => My refactored solution might actually be harder to read due to the more complex methodology I used, but I think my comments should help clarify what is going on.