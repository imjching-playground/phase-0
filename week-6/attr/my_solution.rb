#Attr Methods

# I worked on this challenge by myself.

# I spent [#] hours on this challenge.

class NameData

end


class Greetings

end



# Reflection Part 1

# RELEASE 1
# What are these methods doing?
# => The methods print or change instance variables stored in the instance of Profile.

# How are they modifying or returning the value of instance variables?
# => They print or set instance variables that were initialized with the instance.

# RELEASE 2
# What changed between the last release and this release?
# => An attribute reader is used to print the @age instance variable.

# What was replaced?
# => The #what_is_age method and all references to it.

# Is this code simpler than the last?
# => Yes, it requires less code to implement.

# RELEASE 3
# What changed between the last release and this release?
# => An attribute writer is used to modify the @age instance variable.

# What was replaced?
# => The #change_my_age= method.

# Is this code simpler than the last?
# => Yes.

# Reflection Part 2

# What is a reader method?
# => Can be called on an object and return the value of an instance variable.

# What is a writer method?
# => Can be called on an object to change the value of an instance variable.

# What do the attr methods do for you?
# => They save you the work of creating a class method to return/change instance variables.

# Should you always use an accessor to cover your bases? Why or Why not?
# => No, you should only make information available to other parts of the program
# => if it is absolutely necessary. "Information hiding" and encapsulation are
# => important tenets of information security and also helps minimize cascading of
# => bugs.

# What is confusing to you about these methods?
# => Nothing confusing, but they are still a little unfamiliar to me.