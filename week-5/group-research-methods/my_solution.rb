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

  integers = []
  strings = []

  source.each do |item|
    integers << item if item.is_a? Integer
    strings << item if item.is_a? String
  end

  [integers, strings]

end

def my_hash_splitting_method(source, age)

  younguns = []
  geezers = []

  source.each do |key, value|
    if value <= age
      younguns << [key, value] 
    else
      geezers << [key, value]
    end
  end

  [younguns, geezers]

end

# Identify and describe the Ruby method(s) you implemented.
# :my_array_splitting_method takes an array of integers and strings as its argument and 
# splits the array into two arrays, one with integers and one with strings. Then it returns 
# an array containing both of those arrays. The method takes advantage of the :is_a? method, 
# which takes a class name as its argument. It returns true or false, depending on whether
# the object calling the method is a member of the argument class.

# :my_hash_splitting_method takes two arguments: (1) a hash that has integers for its values and (2) 
# an integer. It then creates two arrays: one containing the key-value pairs for which the values
# are less than or equal to the second argument; the other array contains the rest of the key-value 
# pairs. Then it returns an array containing both of those arrays.


# Release 3: Reflect!
# What did you learn about researching and explaining your research to others?
#
#
#
#