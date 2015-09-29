# Concatenate Two Arrays

# I worked on this challenge by myself.


# Your Solution Below

def array_concat(array_1, array_2)
  #avoiding array_1 + array_2 in order to use iteration
  result = []

  array_1.each do |el|
    result << el
  end

  array_2.each do |el|
    result << el
  end

  result
end