# OO Basics: Student


# I worked on this challenge by myself.
# This challenge took me 1 hour.


# Pseudocode



# Initial Solution

class Student
  attr_accessor :scores, :first_name

  def initialize(name, scores)
    @first_name = name
    @scores = scores
  end

  def average
    @scores.inject(:+)/@scores.length
  end

  def letter_grade
    case
    when self.average >= 90
      return "A"
    when self.average >= 80
      return "B"
    when self.average >= 70
      return "C"
    when self.average >= 60
      return "D"
    else
      return "F"
    end
  end
end

students = [
  Student.new("Alex", [100,100,100,0,100]),
  Student.new("Miranda", [1,2,3,4,5]),
  Student.new("Bosephus", [1,2,3,4,5]),
  Student.new("Bro", [1,2,3,4,5]),
  Student.new("Molly", [1,2,3,4,5]),
]

def linear_search(array, name)
  array.each do |student|
    return array.index(student) if student.first_name == name
  end
  -1
end

def binary_search(array, name)
  midpoint = array.length / 2
  array[midpoint].first_name > name ? idx = 0 : idx = midpoint

  while idx < array.length
    student = array[idx]
    return idx if student.first_name == name
    idx += 1
  end
  -1
end

# Refactored Solution






# DRIVER TESTS GO BELOW THIS LINE
# Initial Tests:

p students[0].first_name == "Alex"
p students[0].scores.length == 5
p students[0].scores[0] == students[0].scores[4]
p students[0].scores[3] == 0


# Additional Tests 1:

p students[0].average == 80
p students[0].letter_grade == 'B'

# Additional Tests 2:

p linear_search(students, "Alex") == 0
p linear_search(students, "NOT A STUDENT") == -1

p binary_search(students, "Alex") == 0
p binary_search(students, "NOT A STUDENT") == -1


# Reflection