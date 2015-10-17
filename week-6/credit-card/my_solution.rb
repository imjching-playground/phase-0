# # Class Warfare, Validate a Credit Card Number


# I worked on this challenge with: Un Choi.
# I spent 1.66 hours on this challenge.

# Pseudocode

# Input: 16-digit integer
# Output: true or false
# Steps:

# define method initialize that takes one argument(card_number)
#  --convert card_number to string
#  --Set instance variable @card_number = card_number
#     IF card_number does not equal 16, raise ArgumentError

# define method double_every_other
# --from the second-to-last digit, double every other digit until the first digit
#   --enter digits in card_number to an array(card_number_array)
#   --set counter at 14
#   --set while loop--WHILE counter is greater than or equals to zero:
#       --double card_number_array at index[counter]
#       --subtract 2 from counter
#   --return card_number_array

# define method sum_numbers(card_number_array)
# --sum all the doubled digits plus the remainder of the digits
# --for each number in card_number_array:
#   --IF number is greater than 9
#       --convert number to string and convert index 0 and index 1 to integer. Then add index 0 and index 1
#  --set variable sum equal to the total sum of each number in the card_number_array
#  --return sum


# define method check_card
# -- call sum_numbers on double_every_other
# --if the total sum_numbers is a multiple of 10, valid number so return true, else false




# Initial Solution

# Don't forget to check on initialization for a card length
# of exactly 16 digits

# class CreditCard
#   def initialize(card_number)
#     @card_number = card_number.to_s

#     if @card_number.length != 16
#       raise ArgumentError.new("Number does not have 16 digits")
#     end
#   end

#   def double_every_other
#     @card_number_array = @card_number.split(//)

#     counter = 14
#     while counter >= 0
#       @card_number_array[counter] = @card_number_array[counter].to_i * 2
#       counter -= 2
#     end

#     @card_number_array.map! { |number| number.to_i }
#   end

#   def sum_numbers(card_number_array)
#     sum = 0

#     card_number_array.map! do |number|
#       if number > 9
#         number = number.to_s[0].to_i + number.to_s[1].to_i
#       end
#       sum += number
#     end

#     sum
#   end

#   def check_card
#     sum = sum_numbers(double_every_other)
#     if sum % 10 == 0
#       true
#     else
#       false
#     end
#   end
# end



# Refactored Solution

class CreditCard
  def initialize(card_number)
    @card_number = card_number.to_s

    raise ArgumentError.new("Number does not have 16 digits") if @card_number.length != 16
  end

  def double_every_other
    @card_number_array = @card_number.split(//)

    counter = 14
    while counter >= 0
      @card_number_array[counter] = @card_number_array[counter].to_i * 2
      counter -= 2
    end

    @card_number_array.map! { |number| number.to_i }
  end

  def sum_numbers(card_number_array)
    sum = 0

    card_number_array.map! do |number|
      if number > 9
        number = number.to_s[0].to_i + number.to_s[1].to_i
      end
      sum += number
    end

    sum
  end

  def check_card
    sum = sum_numbers(double_every_other)

    sum % 10 == 0
  end
end

# Driver Code

myCC = CreditCard.new(4408041234567901)

p myCC.double_every_other

p myCC.sum_numbers([8, 4, 0, 8, 0, 4, 2, 2, 6, 4, 10, 6, 14, 9, 0, 1])

p myCC.check_card

my_bad_CC = CreditCard.new(1234123412341234)

p my_bad_CC.check_card




# Reflection

# What was the most difficult part of this challenge for you and your pair?
# => It was a little confusing to convert back and forth between integers and
# => strings in order to pick out digits. We had to mentally keep track of
# => what state the values were in at each point of the program. If I were to
# => spend more time on this program, I might have added some comments to help
# => with that.

# What new methods did you find to help you when you refactored?
# => We used methods that I was already familiar with. I introduced my partner
# => to #split! and #map!.

# => I did find myself wondering after the refactoring if there was a more
# => efficient way of looping through every nth element, and discovered you
# => can use the Range#step method. I would refactor using #step if I had more
# => time.

# What concepts or learnings were you able to solidify in this challenge?
# => I'm not sure if I would split this up into as many methods if I were to
# => do it again. #double_every_other and #sum_numbers are not really useful
# => without the other and I think it adds unnecessary length and complexity
# => to pass information between them.