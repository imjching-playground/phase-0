# Introduction to Inheritance

# I worked on this challenge by myself.


# Pseudocode

=begin
------------------
CLASS GlobalCohort
DEFINE reader methods for: "@name", @students", "@email_list", "@p0_start_date",
  "@immersive_start_date", "@graduation_date" "@email_list", "@num_of_students"

DEFINE method "initialize", arguments: "name" (string), "students" (array), "email_list" (array),
  "p0_start_date" (date), "immersive_start_date" (date), "graduation_date" (date),
  "email_list" (array)
  SET instance variables equal to each respective argument
  SET instance variable "@num_of_students" equal to length of students

DEFINE method "add_student", argument: "name" (string)
  PUSH name to @students
  INCREMENT @num_of_students by 1

DEFINE method "remove_student", argument: "name" (string)
  DELETE name from @students
  DECREMENT @num_of_students by 1

DEFINE method "currently_in_phase"
  IF current date is less than @immersive_start_date
    RETURN "Currently in Phase 0"
  ELSE IF current date is less than 3 weeks after @immersive_start_date
    RETURN "Currently in Phase 1"
  ELSE IF current date is less than 6 weeks after @immersive_start_date
    RETURN "Currently in Phase 2"
  ELSE IF current date is less than 9 weeks after @immersive_start_date
    RETURN "Currently in Phase 3"

DEFINE method "graduated?"
  IF current date is greater than or equal to @graduation_date
    RETURN true
  ELSE
    RETURN false
------------------
CLASS LocalCohort inherits from GlobalCohort
DEFINE reader method for: "@city"

DEFINE method "initialize", arguments: "students" (array), "email_list" (array), "city" (string)
  SET instance variables equal to each argument

------------------
=end


# Initial Solution

class GlobalCohort
  attr_reader :name, :students, :email_list, :p0_start_date, :immersive_start_date,
    :graduation_date, :email_list, :num_of_students

  def initialize(name, students, email_list, p0_start_date, immersive_start_date, graduation_date)
    @name, @students, @email_list, @p0_start_date, @immersive_start_date, @graduation_date =
      name, students, email_list, p0_start_date, immersive_start_date, graduation_date
    @num_of_students = @students.length
  end

  def add_student(name)
    @students << name
    @num_of_students += 1
  end

  def remove_student(name)
    @students.delete(name)
    @num_of_students -= 1
  end

  def currently_in_phase
    three_weeks = 60*60*24*21
    if immersive_start_date > Time.now.to_i
      return "Currently in Phase 0."
    elsif immersive_start_date + three_weeks > Time.now.to_i
      return "Currently in Phase 1."
    elsif immersive_start_date + 2 * three_weeks > Time.now.to_i
      return "Currently in Phase 2."
    elsif immersive_start_date + 3 * three_weeks > Time.now.to_i
      return "Currently in Phase 3."
    end
  end

  def graduated?
    Time.now.to_i > @graduation_date
  end
end

class LocalCohort < GlobalCohort
  attr_reader :city

  def initialize(name, students, email_list, p0_start_date, immersive_start_date, graduation_date, city)
    @name, @students, @email_list, @p0_start_date, @immersive_start_date, @graduation_date, @city =
      name, students, email_list, p0_start_date, immersive_start_date, graduation_date, city
    @num_of_students = @students.length
  end
end


# Refactored Solution

#refactor time calculations, number of init args



# Tests

copperheads = LocalCohort.new("Copperheads", ["Steven", "John", "Nicole"], ["brodericksteven@gmail.com", "john@me.com", "nicole@msn.com"], 1441512660, 1446955889, 1452399089, "San Francisco")

p copperheads.students
p copperheads.num_of_students
p copperheads.currently_in_phase
p copperheads.graduated?
p copperheads.city

# Reflection