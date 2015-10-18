# Implement a Reverse Polish Notation Calculator


# I worked on this challenge by myself.

# Pseudocode

# Input:  a string containing 2 integers and 1 arithmetic operator, each
#   separated by a whitespace.
# Output: an integer
# Steps:


# DEFINE method evaluate that takes as its argument a string "expression"
#   SPLIT "expression" string using whitespace as delimiter (so that both
#     numbers and the operator are separate elements)
#     AND SET a variable "expression_array" equal to that value
#   SET three variables operand_1, operand_2, and operator equal
#     to index 0, 1, and 2 of of expression_array respectively
#   IF operator is +, -, *, /
#     THEN perform the corresponding mathematical operation on th operand_1
#       and operand_2
#       AND RETURN result

# Initial Solution

# class RPNCalculator # => oops, only works for 2-operand expressions
#   def evaluate(expression)
#     expression_array = expression.split
#     operand_1 = expression_array[0].to_i
#     operand_2 = expression_array[1].to_i
#     operator = expression_array[2]

#     if operator == "+"
#       operand_1 + operand_2
#     elsif operator == "-"
#       operand_1 - operand_2
#     elsif operator == "*"
#       operand_1 * operand_2
#     elsif operator == "/"
#       operand_1 / operand_2
#     else
#       "unexpected operation"
#     end
#   end
# end

# calc = RPNCalculator.new

# p calc.evaluate('1 2 +')   # => 3
# p calc.evaluate('2 5 *')   # => 10
# p calc.evaluate('50 20 -') # => 30

# 4. Refactored Solution (using stack)

# class RPNCalculator
#   def evaluate(input)
#     input = input.split

#     stack = []

#     input.each do |el|
#       # add only numbers to stack
#       unless ["+", "-", "*", "/"].include? el
#         stack << el.to_i
#       end

#       # perform operation based on operator symbol
#       if ["+", "-", "*", "/"].include? el
#         operands = stack.pop(2)

#         case el
#         when "+"
#           stack << operands[0] + operands[1]
#         when "-"
#           stack << operands[0] - operands[1]
#         when "*"
#           stack << operands[0] * operands[1]
#         when "/"
#           stack << operands[0] / operands[1]
#         end
#       end
#     end

#     stack[0]
#   end
# end

#Re-refactored (cleaned up stack method)

class RPNCalculator
  def evaluate(input)
    input = input.split
    stack = []

    input.each do |el|
      # add only numbers to stack
      if !["+", "-", "*", "/"].include? el
        stack << el.to_i

      # perform operation based on operator symbol
      else
        operands = stack.pop(2)

        case el
        when "+"
          stack << operands[0] + operands[1]
        when "-"
          stack << operands[0] - operands[1]
        when "*"
          stack << operands[0] * operands[1]
        when "/"
          stack << operands[0] / operands[1]
        end
      end
    end

    stack[0]
  end
end

calc = RPNCalculator.new

p calc.evaluate('1 2 +')   # => 3
p calc.evaluate('2 5 *')   # => 10
p calc.evaluate('50 20 -') # => 30
p calc.evaluate('1 2 + 3 4 + *')  # => 21



# Reflection