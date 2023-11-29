# Run each line of code below (either from this file or in IRB individually).
#  Then, in a ruby comment, write 1-2 sentences describing what is happening, using ALL the involved vocabulary terms you've learned in this lesson so far.

# EXAMPLE
# The downcase method is called on the string object "Hello World"
# No arguments are passed; downcase has one clear job which is to lowercase all letters that exist in the String
# The return value is "hello world"
"Hello World".downcase

# YOU DO the rest:


puts "Hello World".include?("Hello")
#it is asking if "Hello" is include in the method, it is so it returns true

puts "Hello World".end_with?("Hello")
#its asking if the bject string ends with "Hello" which returns a false because it ends with world

puts "Hello World".end_with?("rld")
#it is asking if the object string ends with "rld" it returns a true because it ends with world

12.even?
# this is for a numeric string and it will also return a true or fall term based on the number

18.next
# this is also for a numeric string and will go to the next number after the origanl number
