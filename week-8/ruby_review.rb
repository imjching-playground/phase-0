## ============================================================================
## Bingo 2
## ============================================================================
# Create a Bingo Scorer (SOLO CHALLENGE)

# I spent 1 hours on this challenge.

# Pseudocode

# DEFINE a class "BingoScorer"
#   DEFINE initialize
#     ASSIGN instance variable @solved to false

#   DEFINE a method "check" that takes a 2-d array argument "board"

# (check horizontal bingo )
#     FOR EACH row in board
#       IF count of 'x' in row equals 5
#         SET @solved to true

# (check vertical bingo)
#     ASSIGN variable "column" to 0
#       FOR EACH row in board
#         ASSIGN variable x_in_column equal to 0
#         IF value in row at column_number equals 'x'
#           INCREMENT x_in_column by 1
#         IF x_in_row equals 5
#           SET @solved to true

# (check top-bottom diagonal bingo)
#     ASSIGN variable diagonal_values to empty array
#     ASSIGN variable "counter" to 0
#     WHILE counter is less than 5
#       GET value in board at row "counter" at index "counter"
#       PUSH that value to diagonal_values
#       INCREMENT counter by 1
#     IF count of 'x' in diagonal_values equals 5
#       SET @solved to true

# (check bottom-top diagonal bingo)
#     ASSIGN variable diagonal_values to empty array
#     ASSIGN variable "counter" to 4
#     WHILE counter is greater than -1
#       GET value in board at row "counter" at index "counter"
#       PUSH that value to diagonal_values
#       DECREMENT counter by 1
#     IF count of 'x' in diagonal_values equals 5
#       SET @solved to true



# sample boards

# horizontal = [[47, 44, 71, 8, 88],
#               ['x', 'x', 'x', 'x', 'x'],
#               [83, 85, 97, 89, 57],
#               [25, 31, 96, 68, 51],
#               [75, 70, 54, 80, 83]]

# vertical = [[47, 44, 71, 'x', 88],
#             [22, 69, 75, 'x', 73],
#             [83, 85, 97, 'x', 57],
#             [25, 31, 96, 'x', 51],
#             [75, 70, 54, 'x', 83]]


# top_to_bottom = [['x', 44, 71, 8, 88],
#                  [22, 'x', 75, 65, 73],
#                  [83, 85, 'x', 89, 57],
#                  [25, 31, 96, 'x', 51],
#                  [75, 70, 54, 80, 'x']]


# bottom_to_top = [[47, 44, 71, 8, 'x'],
#                   [22, 69, 75, 'x', 73],
#                   [83, 85, 'x', 89, 57],
#                   [25, 'x', 96, 68, 51],
#                   ['x', 70, 54, 80, 83]]


# Initial Solution

# class BingoScorer
#   def initialize
#     @solved = false
#   end

#   def check(board)
#     @board = board

#     check_horizontal
#     check_vertical
#     check_top_to_bottom
#     check_bottom_to_top

#     @solved
#   end

#   def check_horizontal
#     @board.each {|row| @solved = true if row.count('x') == 5}
#   end

#   def check_vertical
#     column = 0
#     5.times do
#       x_in_column = 0
#       @board.each do |row|
#         x_in_column += 1 if row.at(column) == 'x'
#         @solved = true if x_in_column == 5
#       end
#       column += 1
#     end
#   end

#   def check_top_to_bottom
#     diagonal_values = []
#     counter = 0
#     while counter < 5
#       diagonal_values << @board[counter].at(counter)
#       counter += 1
#     end
#     @solved = true if diagonal_values.count('x') == 5
#   end

#   def check_bottom_to_top
#     diagonal_values = []
#     row_counter = 4
#     column_counter = 0
#     5.times do
#       diagonal_values << @board[row_counter].at(column_counter)
#       row_counter -= 1
#       column_counter += 1
#     end
#     @solved = true if diagonal_values.count('x') == 5
#   end
# end


# Refactored Solution

# class BingoScorer
#   def initialize
#     @solved = false
#   end

#   def check(board)
#     check_horizontal(board)
#     check_vertical(board)
#     check_top_to_bottom(board)
#     check_bottom_to_top(board)
#     check_inside_corners(board)
#     check_postage_stamp(board)
#     check_small_diamond(board)
#     check_outside_corners(board)

#     @solved
#   end

#   def check_horizontal(board)
#     @solved = true if board.detect { |row| row.count('x') == 5 }
#   end

#   def check_vertical(board)
#     check_horizontal(board.transpose)
#   end

#   def check_top_to_bottom(board)
#     @solved = true if (0..4).collect {|i| board[i][i]}.count('x') == 5
#   end

#   def check_bottom_to_top(board)
#     check_top_to_bottom(board.transpose)
#   end

#   def check_inside_corners(board)
#     @solved = true if [board[1][1], board[1][3], board[3][1], board[3][3]].count('x') == 4
#   end

#   def check_postage_stamp(board)
#     @solved = true if [board[0][0], board[0][1], board[1][0], board[1][1]].count('x') == 4
#     @solved = true if [board[0][3], board[0][4], board[1][3], board[1][4]].count('x') == 4
#     @solved = true if [board[3][0], board[3][1], board[4][0], board[4][1]].count('x') == 4
#     @solved = true if [board[3][3], board[3][4], board[4][3], board[4][4]].count('x') == 4
#   end

#   def check_small_diamond(board)
#     @solved = true if [board[1][2], board[2][1], board[2][3], board[3][2]].count('x') == 4
#   end

#   def check_outside_corners(board)
#     @solved = true if [board[0][0], board[0][4], board[4][0], board[4][4]].count('x') == 4
#   end
# end




# DRIVER TESTS GO BELOW THIS LINE
# implement tests for each of the methods here:

# scorer = BingoScorer.new
# p scorer.check(horizontal)
# p scorer.check(vertical)
# p scorer.check(top_to_bottom)
# p scorer.check(bottom_to_top)

# inside_corners = [[47, 44, 71, 14, 88],
#                   [22, 'x', 75, 'x', 73],
#                   [83, 85, 'x', 44, 57],
#                   [25, 'x', 96, 'x', 51],
#                   [75, 70, 54, 66, 83]]

# # a corner and three surrounding numbers create a square
# postage_stamp =  [[47, 44, 71, 'x', 'x'],
#                   [22, 69, 75, 'x', 'x'],
#                   [83, 85, 97, 55, 57],
#                   [25, 31, 96, 55, 51],
#                   [75, 70, 54, 55, 83]]

# small_diamond =  [[47, 44, 71, 44, 88],
#                   [22, 69, 'x', 44, 73],
#                   [83, 'x', 'x', 'x', 57],
#                   [25, 31, 'x', 44, 51],
#                   [75, 70, 54, 44, 83]]

# outside_corners = [['x', 44, 71, 64, 'x'],
#                    [22, 69, 75, 64, 73],
#                    [83, 85, 97, 64, 57],
#                    [25, 31, 96, 64, 51],
#                    ['x', 70, 54, 64, 'x']]

# p scorer.check(inside_corners)
# p scorer.check(postage_stamp)
# p scorer.check(small_diamond)
# p scorer.check(outside_corners)



# ## ============================================================================
# ## Dr. Evil's Cipher
# ## ============================================================================
# # Cipher Challenge

# # I worked on this challenge [by myself, with:]
# # I spent [#] hours on this challenge.

# # 1. Solution
# # Write your comments on what each thing is doing.
# # If you have difficulty, go into IRB and play with the methods.

# def dr_evils_cipher(coded_message)
#   input = coded_message.downcase.split("") # Check out this method in IRB to see how it works! Also refer to the Ruby docs.
#   decoded_sentence = []
#   cipher = {"e" => "a",   # This is technically a shift of four letters...Can you think of a way to automate this? Is a hash
#             "f" => "b",   # the best data structure for this problem? What are the pros and cons of hashes?
#             "g" => "c",
#             "h" => "d",
#             "i" => "e",
#             "j" => "f",
#             "k" => "g",
#             "l" => "h",
#             "m" => "i",
#             "n" => "j",
#             "o" => "k",
#             "p" => "l",
#             "q" => "m",
#             "r" => "n",
#             "s" => "o",
#             "t" => "p",
#             "u" => "q",
#             "v" => "r",
#             "w" => "s",
#             "x" => "t",
#             "y" => "u",
#             "z" => "v",
#             "a" => "w",
#             "b" => "x",
#             "c" => "y",
#             "d" => "z"}

#   input.each do |x| # What is #each doing here?
#     found_match = false  # Why would this be assigned to false from the outset? What happens when it's true?
#     cipher.each_key do |y| # What is #each_key doing here?
#       if x == y  # What is this comparing? Where is it getting x? Where is it getting y? What are those variables really?
#         decoded_sentence << cipher[y]
#         found_match = true
#         break  # Why is it breaking here?
#       elsif x == "@" || x == "#" || x == "$" || x == "%"|| x == "^" || x == "&"|| x =="*" #What the heck is this doing?
#         decoded_sentence << " "
#         found_match = true
#         break
#       elsif (0..9).to_a.include?(x) # Try this out in IRB. What does   " (0..9).to_a "    do?
#         decoded_sentence << x
#         found_match = true
#         break
#       end
#     end
#     if not found_match  # What is this looking for?
#       decoded_sentence << x
#     end
#   end
#   decoded_sentence = decoded_sentence.join("")
#   #What is this method returning?
# end

# # Your Refactored Solution





# # Driver Test Code:
# p dr_evils_cipher("m^aerx%e&gsoi!") == "i want a coke!" #This is driver test code and should print true
# # Find out what Dr. Evil is saying below and turn it into driver test code as well. Driver test code statements should always return "true."
# p dr_evils_cipher("syv%ievpc#exxiqtxw&ex^e$xvegxsv#fieq#airx%xlvsykl$wizivep#tvitevexmsrw.#tvitevexmsrw#e*xlvsykl#k&aivi%e@gsqtpixi&jempyvi.
# &fyx%rsa,$pehmiw@erh#kirxpiqir,%ai%jmreppc@lezi&e&asvomrk%xvegxsv#fieq,^almgl^ai^wlepp%gepp@tvitevexmsr^l")
# p dr_evils_cipher("csy&wii,@m'zi@xyvrih$xli*qssr$mrxs&alex@m#pmoi%xs#gepp%e^hiexl#wxev.")
# p dr_evils_cipher("qmrm#qi,*mj^m#iziv^pswx#csy#m^hsr'x%orsa^alex@m%asyph^hs.
# @m'h%tvsfefpc%qszi$sr%erh*kix#ersxliv$gpsri@fyx*xlivi@asyph^fi@e^15&qmryxi@tivmsh%xlivi$alivi*m*asyph&nywx^fi$mrgsrwspefpi.")
# p dr_evils_cipher("alc@qeoi*e$xvmppmsr^alir#ai*gsyph%qeoi...#fmppmsrw?")

#
# # Keep you limited to 10-15 minutes!

# ## ============================================================================
# ## Fibonacci Sequence
# ## ============================================================================
# # I worked on this challenge by myself.
# # This challenge took me [#] hours.

# # Pseudocode



# # Initial Solution

# def is_fibonacci?(num)

# end



# # Refactored Solution







#

# ## ============================================================================
# ## FizzBuzz Super Edition
# ## ============================================================================
# I worked on this challenge by myself.
# This challenge took me 0.5 hours.


# Pseudocode
# DEFINE a method super_fizzbuzz that takes an array of integers "num_array" as argument
#   ASSIGN a variable fizzbuzzed to empty array
#   FOR EACH number in num_array
#     IF number is divisible by 15
#       PUSH "FizzBuzz" to fizzbuzzed
#     ELSE IF number is divisible by 5
#       PUSH "Buzz" to fizzbuzzed
#     ELSE IF number is divisible by 3
#       PUSH "Fizz" to fizzbuzzed
#     ELSE
#       PUSH number to fizzbuzzed
#   RETURN fizzbuzzed


# Initial Solution

# def super_fizzbuzz(num_array)
#   fizzbuzzed = []
#   num_array.each do |num|
#     if num % 15 == 0
#       fizzbuzzed << "FizzBuzz"
#     elsif num % 5 == 0
#       fizzbuzzed << "Buzz"
#     elsif num % 3 == 0
#       fizzbuzzed << "Fizz"
#     else
#       fizzbuzzed << num
#     end
#   end
#   fizzbuzzed
# end


# Refactored Solution

# def super_fizzbuzz(num_array)
#   num_array.map do |num|
#     fizzbuzzed_num = ""
#     fizzbuzzed_num += "Fizz" if num % 3 == 0
#     fizzbuzzed_num += "Buzz" if num % 5 == 0
#     fizzbuzzed_num == "" ? num : fizzbuzzed_num
#   end
# end



# p super_fizzbuzz([1,2,3])  # => [1, 2, "Fizz"]
# p super_fizzbuzz([1,2,5])  # => [1, 2, "Buzz"]
# p super_fizzbuzz([1,2,15]) # => [1, 2, "FizzBuzz"]
# p super_fizzbuzz([30, 9, 20, 1]) # => ["FizzBuzz", "Fizz", "Buzz", 1]



## ============================================================================
## Number to English Words
## ============================================================================
# Numbers to English Words


# I worked on this challenge by myself.
# This challenge took me 2 hours.


# Pseudocode

# DEFINE a method in_words that takes an integer "integer" as an argument
#   ASSIGN four variables: "thousands_place", "hundreds_place", "tens_place",
#     "ones_place" and set each equal to 0
#   ASSIGN variables for numbers 0-20 and every 10th number up to 100
#     (30, 40, .., 90, 100 ) and set equal to strings with their names in English
#   IF integer is greater than 1000, set thousands_place equal to int divided by 1000
#   IF integer is greater than 100, set hundreds_place equal to integer modulo
#     1000 divided by 100
#   IF integer is greater than 10, set tens_place equal to integer modulo 100
#     divided by 10
#   SET ones_place equal to integer modulo 10
#   CASE STATEMENT:
#     MAP tens_place, and ones_place to respective (irregular) English names
#   RETURN string: "(thousands_place, if > 0) thousand, (hundreds_place, if > 0)
#     hundred (tens place, if > 0) (ones place)


# Initial Solution

# def in_words(integer)
#   thousands_place, hundreds_place, tens_place, ones_place = 0, 0, 0, 0

#   thousands_place = integer / 1000 if integer >= 1000
#   hundreds_place = integer % 1000 / 100 if integer >= 100
#   tens_place = integer % 100 / 10 if integer >= 10
#   ones_place = integer % 10

#   case thousands_place
#   when 1
#     thousands_place = "one"
#   when 2
#     thousands_place = "two"
#   when 3
#     thousands_place = "three"
#   when 4
#     thousands_place = "four"
#   when 5
#     thousands_place = "five"
#   when 6
#     thousands_place = "six"
#   when 7
#     thousands_place = "seven"
#   when 8
#     thousands_place = "eight"
#   when 9
#     thousands_place = "nine"
#   end

#   case hundreds_place
#   when 1
#     hundreds_place = "one"
#   when 2
#     hundreds_place = "two"
#   when 3
#     hundreds_place = "three"
#   when 4
#     hundreds_place = "four"
#   when 5
#     hundreds_place = "five"
#   when 6
#     hundreds_place = "six"
#   when 7
#     hundreds_place = "seven"
#   when 8
#     hundreds_place = "eight"
#   when 9
#     hundreds_place = "nine"
#   end

#   case tens_place
#   when 1
#     # special cases 10 - 19
#     case ones_place
#       when 0
#         tens_place = "ten"
#       when 1
#         tens_place = "eleven"
#       when 2
#         tens_place = "twelve"
#       when 3
#         tens_place = "thirteen"
#       when 4
#         tens_place = "fourteen"
#       when 5
#         tens_place = "fifteen"
#       when 6
#         tens_place = "sixteen"
#       when 7
#         tens_place = "seventeen"
#       when 8
#         tens_place = "eighteen"
#       when 9
#         tens_place = "nineteen"
#     end
#   when 2
#     tens_place = "twenty"
#   when 3
#     tens_place = "thirty"
#   when 4
#     tens_place = "fourty"
#   when 5
#     tens_place = "fifty"
#   when 6
#     tens_place = "sixty"
#   when 7
#     tens_place = "seventy"
#   when 8
#     tens_place = "eighty"
#   when 9
#     tens_place = "ninety"
#   end

#   case ones_place
#   when 0
#     ones_place = "zero"
#   when 1
#     ones_place = "one"
#   when 2
#     ones_place = "two"
#   when 3
#     ones_place = "three"
#   when 4
#     ones_place = "four"
#   when 5
#     ones_place = "five"
#   when 6
#     ones_place = "six"
#   when 7
#     ones_place = "seven"
#   when 8
#     ones_place = "eight"
#   when 9
#     ones_place = "nine"
#   end

#   english_number = ""
#   english_number += "#{thousands_place} thousand" if integer >= 1000
#   english_number += " #{hundreds_place} hundred" if integer >= 100
#   english_number += " #{tens_place}" if integer >= 10
#   english_number += " #{ones_place}" unless integer.between?(10, 20) || (ones_place == "zero" && integer > 0)
#   english_number.strip
# end

# Refactored Solution

# def in_words(integer)
#   return "zero" if integer == 0

#   thousands_place = integer / 1000 if integer >= 1000
#   hundreds_place = integer % 1000 / 100 if integer >= 100
#   tens_place = integer % 100 / 10 if integer >= 10
#   ones_place = integer % 10

#   number_names_basic = {
#     1 => "one",
#     2 => "two",
#     3 => "three",
#     4 => "four",
#     5 => "five",
#     6 => "six",
#     7 => "seven",
#     8 => "eight",
#     9 => "nine"
#   }

#   return number_names_basic[ones_place] if integer < 10

#   number_names_teens = {
#     0 => "ten",
#     1 => "eleven",
#     2 => "twelve",
#     3 => "thirteen",
#     4 => "forteen",
#     5 => "fifteen",
#     6 => "sixteen",
#     7 => "seventeen",
#     8 => "eighteen",
#     9 => "nineteen"
#   }

#   number_names_tens = {
#     2 => "twenty",
#     3 => "thirty",
#     4 => "forty",
#     5 => "fifty",
#     6 => "sixty",
#     7 => "seventy",
#     8 => "eighty",
#     9 => "ninety"
#   }

#   english_number = ""

#   english_number += "#{number_names_basic[thousands_place]} thousand" if integer >= 1000
#   english_number += " #{number_names_basic[hundreds_place]} hundred" if integer >= 100

#   if integer >= 20
#     english_number += " #{number_names_tens[tens_place]}"
#     english_number += "-" if number_names_tens[tens_place] && number_names_basic[ones_place]
#     english_number += "#{number_names_basic[ones_place]}"
#   else
#     english_number += " #{number_names_teens[ones_place]}"
#   end

#   english_number.strip
# end


# # TESTS

# p in_words(0)         # => "zero"
# p in_words(4)         # => "four"
# p in_words(10)         # => "ten"
# p in_words(11)         # => "eleven"
# p in_words(17)       # => "seventeen"
# p in_words(27)       # => "twenty-seven"
# p in_words(92)       # => "ninety-two"
# p in_words(472)       # => "four hundred seventy-two"
# p in_words(643)       # => "six hundred forty-three"
# p in_words(8190)       # => "eight thousand one hundred ninety"




# ## ============================================================================
# ## PezDispenser
# ## ============================================================================
# # PezDispenser Class from User Stories

# # I worked on this challenge [by myself, with: ].
# # I spent [#] hours on this challenge.


# # 1. Review the following user stories:
# # - As a Pez user, I'd like to be able to "create" a new Pez dispenser with a group of flavors that
# #      represent Pez so it's easy to start with a full Pez dispenser.
# # - As a Pez user, I'd like to be able to easily count the number of Pez remaining in a dispenser
# #      so I can know how many are left.
# # - As a Pez user, I'd like to be able to take a Pez from the dispenser so I can eat it.
# # - As a Pez user, I'd like to be able to add a Pez to the dispenser so I can save a flavor for later.
# # - As a Pez user, I'd like to be able to see all the flavors inside the dispenser so I know the order
# #      of the flavors coming up.


# # Pseudocode



# # Initial Solution

# class PezDispenser

# # your code here!

# end



# # Refactored Solution






# # DRIVER TESTS GO BELOW THIS LINE

# flavors = %w(cherry chocolate cola grape lemon orange peppermint raspberry strawberry).shuffle
# super_mario = PezDispenser.new(flavors)
# puts "A new pez dispenser has been created. You have #{super_mario.pez_count} pez!"
# puts "Here's a look inside the dispenser:"
# puts super_mario.see_all_pez
# puts "Adding a banana pez."
# super_mario.add_pez("banana")
# puts "Now you have #{super_mario.pez_count} pez!"
# puts "Oh, you want one do you?"
# puts "The pez flavor you got is: #{super_mario.get_pez}"
# puts "Now you have #{super_mario.pez_count} pez!"




#

# ## ============================================================================
# ## Reverse Words
# ## ============================================================================
# # Reverse Words


# # I worked on this challenge by myself.
# # This challenge took me 0.33 hours.

# # Pseudocode

# DEFINE a method reverse_words that takes a string "string" as its argument
#   ASSIGN a variable string_array to result of splitting string at whitespace
#   FOR EACH word in string_array
#     SET word equal to reverse of word
#   JOIN string_array back into string with whitespace between each word and RETURN


# # Initial Solution

# def reverse_words(string)
#   string_array = string.split
#   string_array.map! { |word| word.reverse }
#   string_array.join(" ")
# end


# # Refactored Solution

# def reverse_words(string)
#   string.split.map { |word| word.reverse }.join(" ")
# end




# =============================================================================
#  REFLECTION
# =============================================================================

# What concepts did you review or learn in this challenge?
# => I learned a really cool application of the #transpose and #collect methods.
# => I'm especially happy with the technique I found in the Bingo problem to
# => iterate diagonally through the 2-d array.

# What is still confusing to you about Ruby?
# => Stuff we haven't covered yet, mostly.

# What are you going to study to get more prepared for Phase 1?
# => Doing as many extra problems as I can and reading the WGR when I have time.