# A Nested Array to Model a Bingo Board SOLO CHALLENGE

# I spent 6 hours on this challenge.


# Release 0: Pseudocode
# Outline:

# Create a method to generate a letter ( b, i, n, g, o) and a number (1-100)
#   DEFINE method "choose_ball"
#     SET instance variable @bingo_letters equal to array containing "b", "i", "n", "g", and "o".
#     SET instance variable @ball_value equal to an empty array.
#     SELECT a random letter from @bingo_letters and append to @ball_value
#     SELECT a random number between 1-100 (inclusive) and append it to @ball_value
#     RETURN @ball_value
#   END DEFINE

# Check the called column for the number called. If the number is in the column, replace with an 'x'
#   DEFINE method check
#     FOR index 0 of @ball_value (the letter)
#       GET index of that letter in @bingo_letters
#       SET variable col_no to that number
#     END FOR
#     FOR EACH array (row) in board
#       IF that array (row) at index "col_no" equals index 1 of @ball_value (the number)
#         SET the value for the array at that index to "x"
#       END IF
#     END FOR
#   END DEFINE

# Display a column to the console
#   DEFINE method show_column(col_letter)
#     SET variable col_no to index of col_letter in @bingo_letters
#     FOR EACH array (row) in board
#       PRINT value at index col_no with newline
#     END FOR EACH
#   END DEFINE

# Display the board to the console (prettily)
#   DEFINE method show_board
#     FOR EACH array (row) in board
#       PRINT array with newline
#     END FOR EACH
#   END DEFINE

# Initial Solution

# class BingoBoard
#   def initialize(board)
#     @bingo_board = board
#   end

#   def choose_ball
#     @bingo_letters = ["B", "I", "N", "G", "O"]
#     @ball_letter = @bingo_letters[rand(@bingo_letters.length)]  # => random letter
#     @ball_number = rand(100) + 1  # => random number
#     print @ball_letter, @ball_number, "!"
#     puts
#   end

#   def check
#     col_no = @bingo_letters.index(@ball_letter)
#     @bingo_board.each do |row|
#       if row.at(col_no) == @ball_number
#         row[col_no] = "x "
#         puts "***You got one!***"
#       end
#     end
#   end

#   def show_column(col_letter)   # not sure why this method would be used. I made it because the instructions said to.
#     col_no = @bingo_letters.index(col_letter)

#     puts col_letter   # => display header
#     @bingo_board.each { |row| puts row.at(col_no) }  # => print numbers on separate lines
#   end

#   def show_board
#     @bingo_letters.each do |letter| # => make headers
#       print "#{letter}  "
#     end
#     puts

#     @bingo_board.each do |row| # => print each row
#       row.each do |num| # => print numbers from same row on same line with spacing
#         print "#{num} "
#       end
#       puts
#     end
#   end
# end

# Refactored Solution

class BingoBoard
  def initialize
    @bingo_letters = ["B", "I", "N", "G", "O"]

    # possible numbers for each letter
    @b_num_pool = *(1..15)
    @i_num_pool = *(16..30)
    @n_num_pool = *(31..45)
    @g_num_pool = *(46..60)
    @o_num_pool = *(61..75)

    @bingo_board = []

    # randomize numbers
    b_nums = @b_num_pool.sample(5)
    i_nums = @i_num_pool.sample(5)
    n_nums = @n_num_pool.sample(5)
    g_nums = @g_num_pool.sample(5)
    o_nums = @o_num_pool.sample(5)

    # assign numbers to rows
    i = 0
    5.times do
      row = []
        row << b_nums[i]
        row << i_nums[i]
        row << n_nums[i]
        row << g_nums[i]
        row << o_nums[i]
        i += 1
      @bingo_board << row
    end

    # set the middle "freebie" X
    @bingo_board[2][2] = "X "
  end

  def choose_ball
    @ball_letter = @bingo_letters[rand(5)]  # => random letter

    # select randomly from different number pools based on letter
    @ball_number =
      if @ball_letter == "B"
        @b_num_pool[rand(15)]
      elsif @ball_letter == "I"
        @i_num_pool[rand(15)]
      elsif @ball_letter == "N"
        @n_num_pool[rand(15)]
      elsif @ball_letter == "G"
        @g_num_pool[rand(15)]
      else
        @o_num_pool[rand(15)]
      end

    print @ball_letter, @ball_number, "!"
    puts
    puts
  end

  def check
    col_no = @bingo_letters.index(@ball_letter)

    @bingo_board.each do |row|
      if row[col_no] == @ball_number
        row[col_no] = "X "
        puts "*** You got one! ***"
        puts
      end
    end
  end

  def show_column(col_letter)   # this isn't used. I put it in because the directions said to.
    col_no = @bingo_letters.index(col_letter)

    puts col_letter
    @bingo_board.each { |row| puts row[col_no] }
  end

  def show_board
    puts @bingo_letters.join("  ")    # => make headers

    @bingo_board.each do |row|     # => print each row on separate line with numbers spaced
      row.each do |num|
        print "#{num} "
        print " " if num.to_s.length == 1     # => fix alignment for single-digit numbers
      end
      puts
    end
    puts
    puts
  end
end

#DRIVER CODE (I.E. METHOD CALLS) GO BELOW THIS LINE

# BingoBoard class will now initialize with a random valid board (no argument).
# board = [[47, 44, 71, 8, 88],
#         [22, 69, 75, 65, 73],
#         [83, 85, 97, 89, 57],
#         [25, 31, 96, 68, 51],
#         [75, 70, 54, 80, 83]]

new_game = BingoBoard.new
new_game.show_board     # => clean board
new_game.choose_ball    # => call random ball
new_game.check          # => mark "X" on board if it has that combo
new_game.show_board     # => updated board

#Reflection

# How difficult was pseudocoding this challenge? What do you think of your
# pseudocoding style?
# => Pseudocoding was not too difficult but took a long time. I think it saved
# => me time later though. I think my pseudocode style is pretty good. I know
# => what the capabilities of Ruby are for this kind of stuff, so that tells me
# => what size steps I need to break the problem down into.

# What are the benefits of using a class for this challenge?
# => You can have different boards configurations sharing the same methods.

# How can you access coordinates in a nested array?
# => You can reference the index of an index, since each array has an index
# => within its parent array. You can also assign indexes to variables, which
# => creates a pseudo-hash reference.

# What methods did you use to access and modify the array?
# => I mostly used #slice (aka #[]) and #each to access values in the array. I
# => avoided modifying the board array except when putting an "X".

# How did you determine what should be an instance variable versus a local
# variable?
# => I used local variables whenever possible. I only used instance variables
# => if the information needed to shared with other methods in the class.

# What do you feel is most improved in your refactored solution?
# => I made the board prettier and used #join instead of #each and #print to
# => display the headers. I wanted to use #join to print the rows too, but
# => then I think I'd have to fix the single-digit number spacing a different
# => way, so I decided it wouldn't really simplify things.

# => Writing after the option Release 5, I think randomizing the board and
# => calling valid number/letter combinations in the #choose_ball method added
# => a significant amount of complexity. I am sure there is more room for
# => refactoring those aspects of the methods. One of the problems I ran into
# => was that the :rand method returns the same random numbers in each loop,
# => so I had to create a random pool of numbers and drain it with a counter.
# => I would really like to know if there is a way to generate different random
# => numbers on consecutive loops.
