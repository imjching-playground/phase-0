# I worked on this challenge with: Becca Nelson.


# Your Solution Below

def valid_triangle?(a, b, c)

  # IF a, b, or c = zero
  return false if a <= 0 || b <= 0 || c <= 0

  # Triangle Inequality Theorem
  if a + b > c && a + c > b && b + c > a
      true
  else
      false
  end

end
