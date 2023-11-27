# =================================
# PART 1

# Define a variable that stores a string
animals = "they are cute"
puts animals






#  call upcase on the variable, print it out
p animals.upcase
#  call downcase on the variable, print it out
p animals.downcase
#  call reverse on the variable, print it out
p animals.reverse
#  call length on the variable, print it out
p animals.length






# =================================
# PART 2

user_name = "coco_11am"
last_login = "12/09/2021"

# 1: In the Ruby Docs for String methods (https://ruby-doc.org/core-3.1.0/String.html), find 4 methods you have not yet used and call them on one of the variables above. Between reading the documentation and reading the output from calling the methods, make sense of what they do.
  # Write the methods out on the lines below, with an explanation in your own words of how they work.
p user_name.inspect
# copy of self inside double quotes and escapsed
p user_name.chop
# gets rid of the last letter
p user_name.size
# gives the number of letters
p user_name.squeeze
# gets rid of repeating characters

# 2: Do some research (either testing out with your own code or Googling) to build an understanding of what the `!` does, when at the end of a method name. Show your understading by providing an example and writing an explanation.
# the ! makes any method perminant or distructive ex
puts user_name.reverse
ma11_ococ

puts user_name # it reverts back because it is not a perminant method without the !
coco_11am

puts user_name.reverse!
ma11_ococ

puts user_name
ma11_ococ
