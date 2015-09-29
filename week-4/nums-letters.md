#Terms
`puts` prints the object to the console as a string followed by a new line, meaning that the next thing printed to the console will start on its own line (as opposed to `print`). It returns `nil`.

`Integer` and `Float` are subclasses of the `Numeric` class, meaning they are categories of numbers. Integers are whole numbers, meaning they have no decimals (e.g. 1, 10, 2001) and behave in accordance with integer division. Floats are numbers that do have decimal places (e.g. 1.0, 10.751, 2001.3) and they behave in accordance with float division, which is similar to how we usually think of division as working.

#Integer and Float Division
When integers are divided by other integers, the result will always be another integer. For example, if you divide 3 by 2 in integer division, the answer is 1. Integer division is only concerned with how many times a number can be divided without a remainder, which is very useful in programming.

Float division allows fractional answers, so that 3 divided by 2 is 1.5. This is similar to how we typically think of division outside of a programming context. It's worth noting that, due to the way that floats are implemented in programming languages, you can sometimes get an answer that isn't correct in the traditional sense (`1.2 - 1.0 = 0.19999999999999996`).

If you use an integer and a float in a division (or other mathematical) operation, Ruby will automatically convert them both to floats and provide you with a float answer. Convenient!

    DAYS_IN_YEAR = 365.242 #this is a constant

    def hours_in_year
      return DAYS_IN_YEAR * 24
    end

    def minutes_in_decade
      return 10 * DAYS_IN_YEAR * 24 * 60
    end

#Reflection

## How does Ruby handle addition, subtraction, multiplication, and division of numbers?

Addition, subtraction, and multiplication work as expected. Ruby will convert both numbers to float to provide a float answer, if at least one of the numbers is a float, which would almost always be the desired answer. Division is handled differently depending on whether the numbers are floats or integers (see above).

## What is the difference between integers and floats?

Please see above. I'll report this to DBC as a duplicate question.

## What is the difference between integer and float division?

Please see above. I'll report this to DBC as a duplicate question.

## What are strings? Why and when would you use them?

Strings are values placed between single or double quotes and are generally used to store text values. Normally, strings are indivisible text values, such as names, words, or phrases. You could, for example, use a string to ask a user a question and then store their response in another string variable.

## What are local variables? Why and when would you use them?

A local variable is a variable that can only be accessed from within its scope. A variable that is local to my `hours_in_year` method above could not be accessed by my `minutes_in_decade` method, which is why I put my `DAYS_IN_YEAR` variable (or *constant*, rather) at a higher-level scope. Local variables are conventionally written in lower-case snake-case (`my_variable`).

## How was this challenge? Did you get a good review of some of the basics?

I had no trouble with this challenge. It was my first time using rspec, so that was cool.