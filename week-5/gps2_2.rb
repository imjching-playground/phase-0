# # DEFINE 'make_list' which takes no arguments:
# #   create/return a new, empty, hash
def make_list
  {}
end

# # DEFINE 'add_item' which takes arguement: list (hash), items (string), quantity (num)
# #   append new item + quanitiy to hash
# #   return updated hash
def add_item(list, item, quantity)
  list[item] = quantity
end

# # DEFINE 'remove_item' which takes arguement: list (hash), items (string)
# #   delete item + all quanities from hash
# #   return updated hash
def remove_item(list, item)
  list.delete(item)
end

# # DEFINE update_quantity which takes arguement: list (hash), items (string), quantity (num)
# #    locate item key + set new quanitity
# #    return updated hash
def update_quantity(list, item, quantity)
  list[item] = quantity
end

# # DEFINE print_list whichs takes arguement: list (hash)
# #    iterate through each item in list
# #      print each item
# #      print colon
# #      print quantity
# #      new line
def print_list(list)
  list.each { |item, quantity| puts "#{item}: #{quantity}" }
end


# *** TESTS ***

# my_list = make_list
# p my_list == {}

# add_item(my_list, "pasta", 1)
# p my_list == {"pasta" => 1}

# add_item(my_list, "chicken", 2)

# add_item(my_list, "water", 15)
# remove_item(my_list, "pasta")
# p my_list == {}

# update_quantity(my_list, "pasta", 2)
# p my_list == {"pasta" => 2}

# print_list(my_list)

# my_list currently is: {"banana" => "3", "cookies" => "10}

# add_item(list, "water", "3")

# my_list currently is: {"banana" => "3", "cookies" => "10", "water" => "3"}# Create a new list


# *** REFLECTION ***

# What did you learn about pseudocode from working on this challenge?
# => It was interesting pseudocoding the loop printing function. Nothing
# => new for me here with respect to pseudocode, though.

# What are the tradeoffs of using Arrays and Hashes for this challenge?
# => I barely gave any thought to using an array on this challenge. If
# => you used arrays, you would have to have some kind of complicated
# => multidimensional array. Hashes are a much simpler way to store
# => each item and its quantity as a pair.

# What does a method return?
# => It returns whatever you tell it to, which comes after the keyword
# => "return" (explicit return) or the last line of the method (implicit
# => return)

# What kind of things can you pass into methods as arguments?
# => Any object that is of a class that the method can accept. That
# => includes the output of other methods.

# How can you pass information between methods?
# => You can pass the output of a method to another method by passing the
# => method itself (with its required parameters, if applicable) to another
# => method.

# What concepts were solidified in this challenge, and what concepts are still confusing?
# => I had a little trouble at first realizing that the methods could change
# => the value of the external variable. It seems obvious in retrospect that
# => those methods are destructive. I would have thought to create a class for
# => grocery lists instead of doing it this way, so it was forced me to be
# => more creative.





# *** Caroline's Version (Guide) ***

# Add an item with a quantity to the list
# Remove an item from the list
# Update quantities for items in your list
# Print the list (Consider how to make it look nice!)

# DEFINE 'make_list' which takes no arguments:
#   create/return a new, empty, hash
#
# DEFINE 'add', which takes three arguments, item (a string) and quantity (an integer), and list (a hash):
#   add item as a key and quantity as a value pair to the list
#
# DEFINE 'remove', which takes two arguments, an item (string), and a list (hash):
#   delete item key/value pair from hash
#
# DEFINE 'update', which takes three arguments, an item (string), a new quantity (integer) and a list(hash):
#   reassign the key (item) with the value (the new quantity)
#
# DEFINE print_list, which takes one argument, a hash
#   iterate over the hash, for each key/value pair DO the following:
#     print the key, then a hyphen surrounded by spaces, then the value, then a newline
#

def new_list
  {}
end

def add(item, quantity, list)
  return list[item] = quantity unless on_list?(item, list)
  puts "#{item.upcase} is already on your list! Use command `update` to change the quantity."
end

def remove(item, list)
  list.delete(item) { |item| puts "Whoops! #{item.upcase} wasn't on your list!" }
end

def update(item, quantity, list)
  return list[item] = quantity if on_list?(item, list)
  puts "Whoops! #{item.upcase} wasn't on your list!"
end

def print(list)
  list.each { |item, quantity| puts "#{item}: #{quantity}" }
end

def on_list?(item, list)
  list[item]
end

def run
  puts "Hello! Lets get ready to shop!"
  list = new_list
  puts "Type 'help' to see a list of available commands."
  input = ""

  until input[0] == "quit"
    puts "What would you like to do?"
    input = gets.chomp.split(" ")
    puts

    case input[0]
    when 'add' then add(input[2], input[1], list)
    when 'remove' then remove(input[1], list)
    when 'update' then update(input[1], input[2])
    when 'help' then help
    else puts "I'm sorry, I didn't understand you. Make sure you capslock isn't on."
    end
    puts "Got it! Here's what your list looks like now:"
    print(list)
  end
  puts "Goodbye! Come back soon!"
end


def help
  puts "You can use any of the following commands on your list!
When you make the command, fill in the bracketed arguments with specifics.

ex: 'add 5 turnips'

Remember to separate each word by (only) one space.

ADD an item to your list:                         add [number] [item]
REMOVE an item from your list                     remove [item]
UPDATE an item's quantity on your list            update [item] [quantity]

show help message                                 help
exit program                                      quit"
end

run
