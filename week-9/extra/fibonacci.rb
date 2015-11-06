# I worked on this challenge by myself.
# This challenge took me .5 hours.

# Pseudocode



# Initial Solution

def is_fibonacci?(num)
	series = [0, 1]

	current_idx = 2
	while series.length <= num
		series[current_idx] = series[current_idx - 2] + series[current_idx - 1]
		current_idx += 1
	end

	series.include? num
end


# this blows the stack on large numbers like those in the test



# Refactored Solution

# nothing to refactor without using more efficient algorithms





# Reflection