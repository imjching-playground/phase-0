#Full name greeting
puts "Please enter your first name, human."
first_name = gets.chomp

puts "And your MIDDLE name?"
middle_name = gets.chomp

puts "Now enter your last name, meat-bag."
last_name = gets.chomp

puts "Hello, #{first_name} #{middle_name} #{last_name}. Any last words?"

#Bigger, better favorite number
puts "What's your favorite number?"
num = gets.chomp.to_i

puts "#{num} is nice and all, but don't you think #{num+1} is even better?"

# ***REFLECTION***

# Define a variable:
# => Type a variable name and set it as equal to the desired value. Ruby convention is that variables should be in lower-case snake-case and begin with a letter or underscore. Example "my_variable = 0"

# Define a method using this syntax:
# => def method-name optional-parameter(s)
# =>    what-it-does
# => end

# A local variable and a method are both objects in Ruby, but they are very different things. A local variable stores a piece of information (e.g. a string or number). A method stores a procedure that can be used by an object class of some sort (e.g. strings can call the "length" method, numerics can call the "+" method).

# To run a Ruby program from the command line, type:
# => ruby your-file-path.rb
# Obviously, Ruby must be installed on your system first.

# To run an RSpec file from the command line, type:
# => rspec your-rspec-file-path.rb
# You must have RSpec installed and there must be a link in your RSpec file to the Ruby file that you want to test (require_relative).

# Nothing has confused me yet about the Ruby. I understand how RSpec works but I have no idea how to write a test file.

# It says to add links to my other solutions, but I think it's easier for you to just go to the directory in my repo, since I don't think I can put hyperlinks in here.