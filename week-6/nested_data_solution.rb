
# 
# Your previous Plain Text content is preserved below:
# 
# # RELEASE 2: NESTED STRUCTURE GOLF
# # Hole 1
# # Target element: "FORE"
# 
array = [[1,2], ["inner", ["eagle", "par", ["FORE", "hook"]]]]
# 
# # attempts: 1
# # ============================================================
p array[1][1][2][0]
#
# 
# # ============================================================
# 
# # Hole 2
# # Target element: "congrats!"
# 
hash = {outer: {inner: {"almost" => {3 => "congrats!"}}}}
# 
# # attempts: 1
# # ============================================================
p hash[:outer][:inner]["almost"][3]
# 
# 
# # ============================================================
# 
# 
# # Hole 3
# # Target element: "finished"
# 
nested_data = {array: ["array", {hash: "finished"}]}
# 
# # attempts: 1
# # ============================================================
p nested_data[:array][1][:hash]
# 
# 
# # ============================================================
# 
# # RELEASE 3: ITERATE OVER NESTED STRUCTURES
# 
number_array = [5, [10, 15], [20,25,30], 35]

# Initial
# number_array.map! do |elt|
#   if elt.is_a? Array
#     elt.map! { |num| num += 5 }
#   else
#     elt += 5
#   end
# end

# Refactored
def add_five!(array)
  array.map! do |elt|
    elt.is_a?(Integer) ? elt += 5 : add_five!(elt)
  end
end
    
add_five! number_array
p number_array

# 
# 
# 
# # Bonus:
# 
startup_names = ["bit", ["find", "fast", ["optimize", "scope"]]]

# Initial
# startup_names.each do |elt|
#   if elt.is_a? Array
#     elt.each do |subelt|
#       if subelt.is_a? Array
#         subelt.each { |name| puts name + "ly" }
#       else
#         puts subelt + "ly"
#       end
#     end
#   else
#     puts elt + "ly"
#   end
# end

# Refactored
# def add_ly(array)
#   array.each do |elt|
#     if elt.is_a?(String)
#       puts elt + "ly"
#     else
#       add_ly(elt)
#     end
#   end
# end

def add_ly(array)
  array.each do |elt|
    if elt.is_a?(String)
      puts elt + "ly"
    else
      add_ly(elt)
    end
  end
end
    
add_ly(startup_names)


# REFLECTION 
# What are some general rules you can apply to nested arrays? 
# => Each nested array has an index in its parent array by which it can be
# => referenced.

# What are some ways you can iterate over nested arrays?
# => You can use iterators, just as you would with any other array. You do
# => have to take care when calling a method on array elements, because if 
# => some elements are arrays, they might not be able to use that method. That 
# => means you might need to check the class of the element before calling the 
# => method.

# Did you find any good new methods to implement or did you re-use one you were 
# already familiar with? What was it and why did you decide that was a good 
# option?
# => We used methods that were already familiar to us. We did choose to
# => refactor with a recursive solution, since it seemed like the best way to
# => handle inputs with any level of nesting. Our previous solutions only
# => worked on arrays with the same level of nesting or less than the arrays
# => provided with the challenge.