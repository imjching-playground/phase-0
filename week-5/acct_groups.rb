# list of 53 cohortians:

cohortians = [
  "Joshua Abrams",
  "Syema Ailia",
  "Kris Bies",
  "Alexander Blair",
  "Andrew Blum",
  "Jacob Boer",
  "Steven Broderick",
  "Ovi Calvo",
  "Danielle Cameron",
  "Eran Chazan",
  "Jonathan Chen",
  "Un Choi",
  "Kevin Corso",
  "Eric Dell'Aringa",
  "Eunice Do",
  "Ronny Ewanek",
  "John Paul Chaufan Field",
  "Eric Freeburg",
  "Jeffrey George",
  "Jamar Gibbs",
  "Paul Gaston Gouron",
  "Gabrielle Gustilo",
  "Marie-France Han",
  "Noah Heinrich",
  "Jack Huang",
  "Max Iniguez",
  "Mark Janzer",
  "Michael Jasinski",
  "Lars Johnson",
  "Joshua Kim",
  "JAMES KIRKPATRICK",
  "Christopher Lee",
  "Isaac Lee",
  "Joseph Marion",
  "Kevin Mark",
  "Bernadette Masciocchi",
  "Bryan Munroe",
  "Becca Nelson",
  "Van Phan",
  "John Polhill",
  "Jeremy Powell",
  "Jessie Richardson",
  "David Roberts",
  "Armani Saldana",
  "Chris Savage",
  "Parminder Singh",
  "Kyle Smith",
  "Aaron Tsai",
  "Douglas Tsui",
  "Deanna Warren",
  "Peter Wiebe",
  "Daniel Woznicki",
  "Jay Yee"
]

# ***PSEUDOCODE***

# CREATE an empty array called "sets"
# LOOP once for each of the 11 groups (53 / 11 = 5)
# => CREATE empty array called "set"
# => CREATE five unique random numbers corresponding to indices of list of cohortians
# => ADD cohortians corresponding to those five indices to "set"
# => ADD five students from "set" as a nested array within "sets"
# PRINT EACH array of students in "set"

def generate_groups(list)

  # decides how many accountability groups to make
  no_of_groups = (list.length/5.0).ceil
  sets = []

  # loops once per accountability group to assign cohortians
  no_of_groups.times do

    set = []
    while set.length < 5 && list.length > 0
      selected = rand(list.length)
      set << list[selected] unless set.include?(list[selected])
      list.delete_at(selected)
    end

    sets << set
  end

  # pulls two cohortians from other groups if the last group is smaller than 3
  if sets[-1].length < 3
    sets[-1] << sets[-2][0]
    sets[-2].delete_at(0)
    sets[-1] << sets[-3][0]
    sets[-3].delete_at(0)
  end

  n = 1
  sets.each { |set| puts "Group #{n} is #{set}."; n += 1}
end

# generate_groups(cohortians)

# REFACTORED

def generate_groups_refactored(list)

  no_of_groups = (list.length/5.0).ceil

  groups = []

  no_of_groups.times do
    group = list.sample(5)
    groups << group
    group.each do |person|
      list.delete(person)
    end
  end

  n = 1
  groups.each  { |group| puts "Group #{n} is: #{group}"; n += 1}

end

# generate_groups_refactored(cohortians)


# *** REFLECTION ***
# What was the most interesting and most difficult part of this challenge?
# => The most interesting and difficult part was experimenting with different methods to try to reduce the verbosity of my code.

# Do you feel you are improving in your ability to write pseudocode and break the problem down?
# => Sort of... I have a tendency to come up with a different idea while writing my code and then I end up deviating from the pseudocode. Then I go back and change the pseudocode to match (mainly so as not to confuse the reviewer).

# Was your approach for automating this task a good solution? What could have made it even better?
# => I think my code does the job well. Due to the amount of randomness, it is extremely unlikely that it will create the same groups twice. My initial solution can handle any size of cohort, while my refactored one has no restriction against groups of 1 or 2 people. I could make a modification to fix that, but the issue doesn't arise with our cohort size and I'm lazy.

# What data structure did you decide to store the accountability groups in and why?
# => I used arrays extensively, since I just needed to store names in groups of five. I suppose I could have used hashes instead, with the group numbers as values, but I don't see how storing the number as a value would be any better than index-based referencing.

# What did you learn in the process of refactoring your initial solution? Did you learn any new Ruby methods?
# => I have been exposed to a lot of Ruby methods but I often forget them. I came across some few methods that I have seen but never used, or used and forgotten, including :sample and :zip. Not all of them got used in my method.