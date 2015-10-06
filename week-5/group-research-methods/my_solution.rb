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

  integers = source.select { |item| item.is_a? Integer}
  others = source.select { |item| !item.is_a? Integer}

  [integers, others]

end

def my_hash_splitting_method(source, age)

  younguns = source.select { |key, val| val <= age }
  geezers = source.select { |key, val| val > age }

  [younguns.to_a, geezers.to_a]

end

# Identify and describe the Ruby method(s) you implemented.

# :my_array_splitting_method takes an array as its argument and splits the array into two arrays, 
# one with integers and one with everything else. Then it returns an array containing both of those 
# arrays. The method takes advantage of the :select and :is_a? methods:
# => :select returns all items that match the condition in the block.
# => :is_a? takes a class name as its argument and returns true or false, depending on whether
# the object calling the method is a member of the argument class.


# :my_hash_splitting_method takes two arguments: (1) a hash that has integers for its values and (2) 
# an integer. It functions similarly to my other method, except that :select returns the key-value pairs
# as hashes, instead of the two-element arrays that the instructions call for. That's why the final
# line converts each of the groups to arrays with :to_a .


# Release 3: Reflect!
# What did you learn about researching and explaining your research to others?
#
#
#
#