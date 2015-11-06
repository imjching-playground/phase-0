# Create a Car Class from User Stories


# I worked on this challenge by myself.


# 2. Pseudocode
	
# DEFINE a class "Car" with the following methods:

# DEFINE a method "initialize" that takes 2 two arguments (strings): "model", "color"
# 	SET instance variables "@model" and "@color" equal to the arguments
# 	SET instance variable "total_distance" equal to 0

# DEFINE a method "set_distance" that takes 1 argument (number): "miles" 
# 	SET instance variable "miles" equal to argument
# 	INCREMENT total_distance by miles

# DEFINE a method "speed=" that takes 1 argument (number): "mph"
# 	SET instance variable "speed" equal to mph

# DEFINE a method "show_speed" 
# 	PRINT speed

# DEFINE a method "stop"
# 	SET "speed" equal to 0

# DEFINE a method "turn" that that takes 1 argument (string): "direction"
# 	PRINT "The car turns [direction]"

# DEFINE a method "distance_traveled"
# 	PRINT total_distance


# 3. Initial Solution

class Car
	def initialize(model, color)
		@model, @color = model, color
		@total_distance = 0
	end

	def set_distance(miles)
		@total_distance += miles
	end

	def speed=(mph)
		@speed = mph
	end

	def show_speed
		puts "The car is traveling at #{@speed} miles per hour."
	end

	def stop
		self.speed=0
	end

	def turn(direction)
		puts "The car turns #{direction}."
	end

	def distance_traveled
		puts "The car has traveled #{@total_distance} miles total."
	end
end


# 4. Refactored Solution

class Car
	def initialize(model, color)
		@model, @color = model, color
		@distance = 0
	end

	def drive(miles)
		@distance += miles
	end

	def speed=(mph)
		@speed = mph
	end

	def speed
		puts "The car is traveling at #{@speed} miles per hour."
	end

	def stop
		self.speed=0
	end

	def turn(direction)
		puts "The car turns #{direction}."
	end

	def distance
		puts "The car has traveled #{@distance} miles total."
	end
end




# 1. DRIVER TESTS GO BELOW THIS LINE

my_car = Car.new("Corvette", "red")
my_car.drive(0.25)
my_car.speed = 25
my_car.turn("right")
my_car.drive(1.5)
my_car.speed = 35
my_car.speed
my_car.speed = 15
my_car.drive(0.25)
my_car.turn("left")
my_car.drive(1.4)
my_car.speed = 35
my_car.stop
my_car.distance

# 5. Reflection