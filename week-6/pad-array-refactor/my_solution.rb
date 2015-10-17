# Review and Refactor: Pad an Array

# I worked on this challenge by myself.



# First Person's solution I liked
#    What I learned from this solution
# => This solution doesn't work. It creates an infinite loop. The "x" variable
# => will never update its value and thus will always have the same comparison
# => to 0.

# Copy solution here:

# def pad!(array, min_size, value = nil) #destructive
#   x= (min_size - array.length)
#  p  x.times {array << value} while x >= 0
# end

# def pad(array, min_size, value = nil) #non-destructive
#   new_array = Array.new
#   new_array += array
#   x= (min_size - array.length)
#   if x >= 0 then x.times {new_array << value}
#   end
#   return new_array
# end

# Second Person's solution I liked
#    What I learned from this solution
# => array_2 doesn't do anything in #pad!. I think the solution is generally
# => good, but sacrifices a little too much readability for the sake of
# => terseness. It seems like the ternary operator would be more appropriate
# => in the #pad function, but it's not used there for some reason.

# Copy solution here:

# def pad!(array, min_size, value = nil)
#   (min_size - array.length).times {array.push value}
#   (array.length >= min_size) ? array : array_2
# end

# def pad(array, min_size, value = nil)
#   array_2 = array.dup
#   (min_size - array.length).times {array_2.push value}
#   array if array.length >= min_size
#   array_2
# end

# My original solution:

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

# My refactored solution:

# => I don't think my solution will gain anything from incorporating parts of
# => those other solutions. I could maybe use a ternary operator on line 61,
# => but since the append method won't return the whole array, I don't think
# => it will work as it is currently written.


# 5. Reflection
# => It seems pretty good as it already was.