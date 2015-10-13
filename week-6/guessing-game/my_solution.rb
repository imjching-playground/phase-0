# Build a simple guessing game


# I worked on this challenge by myself.
# I spent [#] hours on this challenge.

# Pseudocode

# Input: #initialize and #guess will take a single integer as input.
# Output:
# => #guess will return a symbol: :low, :high:, :correct
# => #solved? will return a boolean.

# Steps:

# CREATE a class "GuessingGame" with three methods:
#   initialize - which takes an integer called "answer" as its argument
#     SET instance variable "@answer" equal to "answer"
#     SET instance variable "@solved_status" equal to false.

#   guess - which takes an integer called "whack" as its argument
#     IF "whack" is greater than "@answer"
#       SET "@solved_status" equal to false
#       RETURN :high
#     ELSE IF "whack" is less than "@answer"
#       SET "@solved_status" equal to false
#       RETURN :low
#     ELSE
#       SET "@solved_status" equal to true
#       RETURN :correct
#     ENDIF

#   solved? - which takes no argument
#     RETURN "@solved_status"


# Initial Solution

# class GuessingGame
#   def initialize(answer)
#     @answer = answer
#     @solved_status = false
#   end

#   def guess(whack)
#     if whack > @answer
#       @solved_status = false
#       :high
#     elsif whack < @answer
#       @solved_status = false
#       :low
#     else
#       @solved_status = true
#       :correct
#     end
#   end

#   def solved?
#     @solved_status
#   end
# end



# Refactored Solution

class GuessingGame
  def initialize(answer)
    @answer = answer
    @solved_status = false
  end

  def guess(whack)
    @solved_status = false

    if whack > @answer
      :high
    elsif whack < @answer
      :low
    else
      @solved_status = true
      :correct
    end
  end

  def solved?
    @solved_status
  end
end

game = GuessingGame.new(10)

p game.solved?   # => false

p game.guess(5)  # => :low
p game.guess(20) # => :high
p game.solved?   # => false

p game.guess(10) # => :correct
p game.solved?   # => true


# Reflection

# How do instance variables and methods represent the characteristics and behaviors (actions) of a real-world object?
# => Instance variables can represent the properties of an object. Instance methods can represent the abilities of
# => objects, or actions that you can perform on them.

# When should you use instance variables? What do they do for you?
# => Instance variables are useful for sharing information between methods within an object. They allow you to read
# => and modify the same variable from anywhere in the object, by putting the variable in a shared scope.

# Explain how to use flow control. Did you have any trouble using it in this challenge? If so, what did you struggle with?
# => I used flow control to refactor my conditional. Rather than set @solved_status to false in two branches of my
# => conditional, I always reset it to false by default and switch it to true only when a correct guess is made. My
# => initial solution requires a repetition, so the refactored version is more DRY.

# Why do you think this code requires you to return symbols? What are the benefits of using symbols?
# => I think it has to do with the different ways to check equality in Ruby. You have to use symbols if you want to pass an
# => object identity comparison.

# => "correct" == "correct"  => true
# => "correct" === "correct" => true
# => "correct".eql? "correct" => true

# BUT.....

# => "correct".equal? "correct" => false
