# Factorial

# I worked on this challenge with: Nicole Yee.


  # ***Recursive***
  # IF number == 0
  # => RETURN 1
  # ELSIF number == 1
  # => RETURN 1
  # ELSE for all other numbers
  # => RETURN factorial(number - 1) * number
  # END

  # ***Non-Recursive***
  # IF number == 0
  # => RETURN 1
  # ELSIF number == 1
  # => RETURN 1
  # ELSE
  # => total = number
    # WHILE number > 1
    # => number = number - 1
    # => total = total * number
    # END
  # RETURN total
  # END

# Your Solution Below
def factorial(number)

  # *** Recursive ***
  # if number == 0 || number == 1
  #   return 1
  # else
  #   return factorial(number - 1) * number
  # end

  # *** Non-Recursive ***
  if number == 0 || number == 1
    return 1
  else
    total = number
    while number > 1
      number -= 1
      total *= number
    end
  return total
  end


end