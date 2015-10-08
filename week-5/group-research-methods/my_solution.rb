# Research Methods

# I spent [] hours on this challenge.

i_want_pets = ["I", "want", 3, "pets", "but", "only", "have", 2]
my_family_pets_ages = {"Evi" => 6, "Ditto" => 3, "Hoobie" => 3, "George" => 12, "Bogart" => 4, "Poly" => 4, "Annabelle" => 0}

# Person 1's solution
def my_array_finding_method(source, thing_to_find)
  source # This line is here to make sure all tests initially fail. Delete it when you begin coding.
end

def my_hash_finding_method(source, thing_to_find)
  source # This line is here to make sure all tests initially fail. Delete it when you begin coding.
end

# Identify and describe the Ruby method(s) you implemented.
#
#
#

# Person 2
def my_array_modification_method!(source, thing_to_modify)
  source.dup # This line is here to make sure all tests initially fail. Delete it when you begin coding.
end

def my_hash_modification_method!(source, thing_to_modify)
  source.dup # This line is here to make sure all tests initially fail. Delete it when you begin coding.
end

# Identify and describe the Ruby method(s) you implemented.
#
#
#


# Person 3
def my_array_sorting_method(source)
  source # This line is here to make sure all tests initially fail. Delete it when you begin coding.
end

def my_hash_sorting_method(source)
   source # This line is here to make sure all tests initially fail. Delete it when you begin coding.
end

# Identify and describe the Ruby method(s) you implemented.
#
#
#


# Person 4
def my_array_deletion_method!(source, thing_to_delete)
  source.dup # This line is here to make sure all tests initially fail. Delete it when you begin coding.
end

def my_hash_deletion_method!(source, thing_to_delete)
  source.dup # This line is here to make sure all tests initially fail. Delete it when you begin coding.
end

# Identify and describe the Ruby method(s) you implemented.
#
#
#


# Person 5 (Steven Broderick)
def my_array_splitting_method(source)
  source.partition { |item| item.is_a? Integer }
end

def my_hash_splitting_method(source, age)
  source.partition { |key, val| val <= age }
end

p my_array_splitting_method(i_want_pets)
p my_hash_splitting_method(my_family_pets_ages, 4)

# Identify and describe the Ruby method(s) you implemented.

# my_array_splitting_method takes an array as its argument and splits the array into two arrays, one with 
#   integers and one with everything else (ages and names, in this case). Then it returns an array containing 
#   both of those arrays. The result is a 2-dimensional array. The method takes advantage of the #partition and 
#   #is_a? methods:

# #partition splits the items into two arrays, putting those that match the condition into one array
#   and those don't into the other.

# #is_a? takes a class name as its argument and returns true or false, depending on whether
#   the object calling the method is a member of the argument class.

# my_hash_splitting_method takes two arguments: (1) a hash that has integers for its values (ages, here) and (2) 
#   an integer (also an age, in this case). It splits the hash into two arrays, one containing the key-value pairs 
#   (as 2-element arrays) for which the value (age) is less than the age passed as an argument. Then it returns an
#   array containing both of those arrays. The result is a 3-dimensional array. This method also takes advantage of
#   #partition, but the condition is different from the other method.


# Release 3: Reflect!
# What did you learn about researching and explaining your research to others?
#
#
#
#