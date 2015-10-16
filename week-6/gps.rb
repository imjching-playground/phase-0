# Your Names
# 1) Steven Broderick
# 2) Kyle Smith

# We spent 1 hours on this challenge.

# Bakery Serving Size portion calculator.

# def serving_size_calc(item_to_make, order_quantity)
#   # stores items with serving sizes
#   library = {"cookie" => 1, "cake" =>  5, "pie" => 7}  # rename library

#   # raises ArgumentError if input "item_to_make" is not found in library hash
#   error_counter = 3  # possible conditional of item_to_make == hash[key]

#   library.each do |food|
#     if library[food] != library[item_to_make]
#       p error_counter += -1
#     end
#   end

#   if error_counter > 0
#     raise ArgumentError.new("#{item_to_make} is not a valid input")
#   end

#   # returns value at item_to_make key in hash
#   serving_size = library.values_at(item_to_make)[0] # s_s = hash[item_to_make]
#   # library.values_at(pie[0]) = [7]
#   #[7][0] = 7

#   # returns how much is left over beyond serving size
#   serving_size_mod = order_quantity % serving_size  #how many people still need to eat

#   # if no leftovers, prints how many servings can be made with order_quantity
#   # if leftovers, does the same, but prints how much leftover
#   case serving_size_mod
#   when 0
#     return "Calculations complete: Make #{order_quantity/serving_size} of #{item_to_make}"  # reword to a more readable version
#   else
#     return "Calculations complete: Make #{order_quantity/serving_size} of #{item_to_make}, you have #{serving_size_mod} leftover ingredients. Suggested baking items: TODO: MAKE THIS FEATURE"  # Reword entirely, and perhaps say bake an extra pie or offer a cookie.
#   end
# end

# p serving_size_calc("pie", 7)
# p serving_size_calc("pie", 8)
# p serving_size_calc("cake", 5)
# p serving_size_calc("cake", 7)
# p serving_size_calc("cookie", 1)
# p serving_size_calc("cookie", 10)
# p serving_size_calc("THIS IS AN ERROR", 5)

#Refactored
def serving_size_calc(item_to_make, order_quantity)
  # stores items with serving sizes
  item_serving_sizes = {"cookie" => 1, "cake" =>  5, "pie" => 7}

  # raises ArgumentError if input "item_to_make" is not found in library hash
  unless item_serving_sizes.has_key?(item_to_make)
    raise ArgumentError.new("#{item_to_make} is not a valid input")
  end

  # returns value at item_to_make key in hash
  serving_size = item_serving_sizes[item_to_make]

  # how many people still need to eat
  hungry_people = order_quantity % serving_size

  # could refactor this but won't due to time
  if hungry_people == 0
    return "Calculations complete: Make #{order_quantity/serving_size} #{item_to_make}(s)"
  elsif hungry_people < 5
    return "Calculations complete: Make #{order_quantity/serving_size} #{item_to_make}(s), you have #{hungry_people} hungry people. Make #{hungry_people} cookies!"
  elsif hungry_people == 6
    return "Calculations complete: Make 1 cake and 1 cookie."
  else
    return "Calculations complete: Make #{order_quantity/serving_size} #{item_to_make}(s), you have #{hungry_people} hungry people. Make a cake!"
  end
end

p serving_size_calc("pie", 7)
p serving_size_calc("pie", 12)
p serving_size_calc("cake", 5)
p serving_size_calc("cake", 7)
p serving_size_calc("cookie", 1)
p serving_size_calc("cookie", 10)
p serving_size_calc("THIS IS AN ERROR", 5)

#  Reflection

# What did you learn about making code readable by working on this challenge?
# => This felt like pure review for me. I suppose the most important lesson
# => in this challenge is to ask some higher power how the program is
# => *supposed* to work. There was no indication that serving_size_mod refers
# => to people and not leftover food, and it was impossible to infer that from
# => the code. The return strings at the end were also misleading as to its
# => meaning, so the guide was the only one who knew.

# Did you learn any new methods? What did you learn about them?
# => I might have seen #values_at before, but never used it. It was used
# => badly here.

# What did you learn about accessing data in hashes?
# => There are some very messy ways to do it if you are so inclined.

# What concepts were solidified when working through this challenge?
# => Bad code is hard to read.