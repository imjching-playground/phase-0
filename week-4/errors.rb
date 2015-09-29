# Analyze the Errors

# I worked on this challenge by myself.
# I spent 1 hour on this challenge.

# --- error -------------------------------------------------------

# "Screw you guys " + "I'm going home." = cartmans_phrase

# 1. What is the name of the file with the error?
# => errors.rb
# 2. What is the line number where the error occurs?
# => line 8
# 3. What is the type of error message?
# => syntax error
# 4. What additional information does the interpreter provide about this type of error?
# => unexpected '=', expecting end-of-input
# 5. Where is the error in the code?
# => after the '='
# 6. Why did the interpreter give you this error?
# => the variable name must be declared before the '=', not after.

# This error was analyzed in the README file.
# --- error

-------------------------------------------------------

# def cartman_hates(thing)
#   while true
#     puts "What's there to hate about #{thing}?"
# end

# This is a tricky error. The line number may throw you off.

# 1. What is the line number where the error occurs?
# => line 183
# 2. What is the type of error message?
# => syntax error
# 3. What additional information does the interpreter provide about this type of error?
# => there is a missing keyword 'end' somewhere
# 4. Where is the error in the code?
# => at the end-of-input, but the cause is really in the above method
# 5. Why did the interpreter give you this error?
# => The method definition above needs two 'end' keywords - one for the 'while' loop and one for the method itself. It has only one.

# If the method were called, it would also spawn an infinite loop, since there is no way for the condition to be false.

# --- error -------------------------------------------------------

# south_park

# 1. What is the line number where the error occurs?
# => line 50
# 2. What is the type of error message?
# => NameError
# 3. What additional information does the interpreter provide about this type of error?
# => it thinks 'south_park' is an undefined variable or method
# 4. Where is the error in the code?
# => the phras 'south_park'
# 5. Why did the interpreter give you this error?
# => 'south_park' doesn't refer to anything. If it's a variable, it needs to be set to some value before being used in this manner. We don't even know whether it's a variable or method without more info.

# --- error -------------------------------------------------------

# cartman()

# 1. What is the line number where the error occurs?
# => line 65
# 2. What is the type of error message?
# => NoMethodError
# 3. What additional information does the interpreter provide about this type of error?
# => it thinks 'cartman' is an undefined method
# 4. Where is the error in the code?
# => the phrase 'cartman()'
# 5. Why did the interpreter give you this error?
# => it appears that someone is trying to call a method 'cartman', but it has not been defined. The parentheses distinguish it from the previous case, because only methods can take parameters.

# --- error -------------------------------------------------------

# def cartmans_phrase
#   puts "I'm not fat; I'm big-boned!"
# end

# cartmans_phrase('I hate Kyle')

# 1. What is the line number where the error occurs?
# => line 82
# 2. What is the type of error message?
# => NomethodError
# 3. What additional information does the interpreter provide about this type of error?
# => I don't know know what the '-@' means (maybe variable?), but it seems to have a problem with 'cartmans_phrase' in conjunction with a Symbol.
# 4. Where is the error in the code?
# => in the method call (not the definition)
# 5. Why did the interpreter give you this error?
# => The method definition does not allow a parameter, but it is being called with a parameter.

# --- error -------------------------------------------------------

# def cartman_says(offensive_message)
#   puts offensive_message
# end

# cartman_says

# 1. What is the line number where the error occurs?
# => line 101
# 2. What is the type of error message?
# => NoMethodError
# 3. What additional information does the interpreter provide about this type of error?
# => same as the previous.
# 4. Where is the error in the code?
# => in the method call
# 5. Why did the interpreter give you this error?
# => the method requires a parameter, as currently defined, but it has been called without one.



# --- error -------------------------------------------------------

# def cartmans_lie(lie, name)
#   puts "#{lie}, #{name}!"
# end

# cartmans_lie('A meteor the size of the earth is about to hit Wyoming!')

# 1. What is the line number where the error occurs?
# => line 122
# 2. What is the type of error message?
# => NoMethodError
# 3. What additional information does the interpreter provide about this type of error?
# => same as the previous two
# 4. Where is the error in the code?
# => in the method call (again)
# 5. Why did the interpreter give you this error?
# => the method requires two parameters, as currently defined, but is being called with only one

# --- error -------------------------------------------------------

# 5 * "Respect my authoritay!"

# 1. What is the line number where the error occurs?
# => line 139
# 2. What is the type of error message?
# => TypeError
# 3. What additional information does the interpreter provide about this type of error?
# => it can't perform the operation on a string.
# 4. Where is the error in the code?
# => after the '*'
# 5. Why did the interpreter give you this error?
# => the multiplication operator can only take a numeric parameter. The object can be a string, however, so this would work if the '5' and the string were switched.

# --- error -------------------------------------------------------

# amount_of_kfc_left = 20/0


# 1. What is the line number where the error occurs?
# => line 154
# 2. What is the type of error message?
# => ZeroDivisionError
# 3. What additional information does the interpreter provide about this type of error?
# => pretty straightforward - a number divided by 0
# 4. Where is the error in the code?
# => after the '/'
# 5. Why did the interpreter give you this error?
# => division by 0 is undefined. You can't do it! Presumably, the intention was to put 0/20.

# --- error -------------------------------------------------------

# require_relative "cartmans_essay.md"

# 1. What is the line number where the error occurs?
# => line 170
# 2. What is the type of error message?
# => syntax error
# 3. What additional information does the interpreter provide about this type of error?
# => unexpected beginning of string. It expected keyword 'do' or parentheses/angle-brackets
# 4. Where is the error in the code?
# => after the first double-quote
# 5. Why did the interpreter give you this error?
# => the parameter should be inside parentheses. Not a very nice question to ask, since all the previous examples of 'require_relative' were in RSpec and *didn't* use parentheses!


# --- REFLECTION -------------------------------------------------------
# Write your reflection below as a comment.

# The NoMethodErrors had the most obtuse error messages, but I knew what was wrong just by looking at the code. The final error was the most confusing for me due to my expectation about require_relative's syntax, but the error message was fairly clear.

# It was obvious when I looked at the code that the definition and call had different amounts of parameters for the NoMethodErrors. I figured out the final error with require_relative by changing the syntax until it ran correctly.

# I could figure out the source of all of the errors by looking at the code, except for the last one. The error messages helped to narrow it down, though.

# Read the error message, check the docs if necessary, and possibly use trial-and-error to edit the syntax.