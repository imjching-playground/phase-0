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