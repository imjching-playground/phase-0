# Virus Predictor

# I worked on this challenge with Morgan O'Leary (Guide) and Steven Broderick
# We spent 1.25 hours on this challenge.

#=======================================================================
# Initial program (commented)
#=======================================================================
=begin
require_relative 'state_data'
# About require & require_relative
# require:
  #-> show a path to a file the programs needs to run
# require_relative:
  #-> helps the program understand it's allready a ruby file.
  #-> It's references the file as they were part of the same file.
class VirusPredictor
  # Initialize is used when the class si called and 3 arguments passed to it.
  # Define a method taking 3 arguments : state_of_origin, population_density, population
  # Creates 3 instance variables based on those 3 arguments (state_of_origin, population_density, population)
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end
  def virus_effects
    # Define a method (virus_effects) taking no arguments.
    # This method is responsible for calling two methods using isntance variables as arguments. First method is predicted_deaths, taking @population_density, @population, @state as arguments and the second one is speed_of_spread taking @population_density, @state as arguments.
    # The methods below are private, that's the reason why they are called through virus_effects.
    predicted_deaths(@population_density, @population, @state)
    speed_of_spread(@population_density, @state)
  end
  private
  # Prevent the functions below from being reached, except by the methods above, by making "private"
  def predicted_deaths(population_density, population, state)
    # Define a method predicted_deaths that takes 3 arguments: population_density, population, state
    # Writes an if/elsif/else statement
    # It takes an instance varible for a state and compare it to a value, then perform a calculation such as (@population * indice).floor (rounding the float to the closer integer) and stores the result in a new variable, called number_of_deaths.
    # The multiplier is larger when the population_density is larger.
    # Prints the result of the calculation in a nice sentance such as: in this state, we wille loose number_od_deaths people ..."
    if @population_density >= 200
      number_of_deaths = (@population * 0.4).floor
    elsif @population_density >= 150
      number_of_deaths = (@population * 0.3).floor
    elsif @population_density >= 100
      number_of_deaths = (@population * 0.2).floor
    elsif @population_density >= 50
      number_of_deaths = (@population * 0.1).floor
    else
      number_of_deaths = (@population * 0.05).floor
    end
    print "#{@state} will lose #{number_of_deaths} people in this outbreak"
  end
  def speed_of_spread(population_density, state) #in months
    # Creates a method speed_of_spread which takes two arguments population density and state.
    # Sets a variable speed to 0.0 (in terms of monthes)
    # Creates an if/elsif/else statement:
    # It compares the population density to a value and increment the speed by an indice.
    # When population density is higher, epidemec speed is higher. (but the number is smaller)
    # print a nice sentence such as " and will spread across the state in #{speed} months."
    speed = 0.0
    if @population_density >= 200
      speed += 0.5
    elsif @population_density >= 150
      speed += 1
    elsif @population_density >= 100
      speed += 1.5
    elsif @population_density >= 50
      speed += 2
    else
      speed += 2.5
    end
    puts " and will spread across the state in #{speed} months.\n\n"
  end
end
# DRIVER CODE
# New feature refactored here: initialize VirusPredictor for each state and check virus effects:
STATE_DATA.each {|state, data| VirusPredictor.new(state, STATE_DATA[state][:population_density], STATE_DATA[state][:population]).virus_effects }
alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
alabama.virus_effects
jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
jersey.virus_effects
california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
california.virus_effects
alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
alaska.virus_effects
=end

#=======================================================================
# Refactored solution
#=======================================================================

require_relative 'state_data'

class VirusPredictor

  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

  def virus_effects
    predicted_deaths & speed_of_spread
  end

  private

  def predicted_deaths
    case
    when @population_density >= 200
      number_of_deaths = (@population * 0.4).floor
    when @population_density >= 150
      number_of_deaths = (@population * 0.3).floor
    when @population_density >= 100
      number_of_deaths = (@population * 0.2).floor
    when @population_density >= 50
      number_of_deaths = (@population * 0.3).floor
    else
      number_of_deaths = (@population * 0.05).floor
    end
    print "#{@state} will lose #{number_of_deaths} people in this outbreak"
  end

  def speed_of_spread
    case
    when @population_density >= 200
      speed = 0.5
    when @population_density >= 150
      speed = 1
    when @population_density >= 100
      speed = 1.5
    when @population_density >= 50
      speed = 2
    else
      speed = 2.5
    end
    puts " and will spread across the state in #{speed} months.\n\n"
  end
end

# DRIVER CODE
# New feature refactored here: initialize VirusPredictor for each state and check virus effects:
STATE_DATA.each {|state, data| VirusPredictor.new(state, data[:population_density], data[:population]).virus_effects }

#=======================================================================
# Reflection Section
#=======================================================================

#On your own, add a commented reflection section to your my_solution.rb file. Answer the following questions in your reflection:

#What are the differences between the two different hash syntaxes shown in the state_data file?
# => The outer hash uses rocket notation and the inner hash uses colon notation.
# => The outer hash uses strings as keys, while the inner hash's notation converts the keys
# => to symbol.

#What does require_relative do? How is it different from require?
# => require_relative links to a file in the same directory. require can take an absolute
# => path or will try to find the filename in the path, but it doesn't "know" the
# => working directory.

#What are some ways to iterate through a hash?
# => #each, #each_key, #each_value, etc.

#When refactoring virus_effects, what stood out to you about the variables, if anything?
# => I guess I noticed that they were instance variables and that there was some
# => repetition of arguments between the two methods.

#What concept did you most solidify in this challenge?
# => "require"-ing a file allows the program to have access to the code in the other
# => file, including variables. I also learned that case statements don't work quite
# => the way I thought they did.