# Defining Our Own Methods
# 1: Write a method named greeting that prints out a general greeting to someone


def greeting(name)
 puts "how is your day"
end

greeting("")




# # What is the return value of your method?
# how is your day
# # How many arguments did you pass your method?
# 1



#2: Write a method named custom_greeting that prints out a greeting WITH a specific name.

def custom_greeting(name)
 puts "how is your day, #{name}"
end

custom_greeting("Lacey")

# # What is the return value of your method?
# how is your day, Lacey
# # How many arguments did you pass your method?
# 1
# # What data type was your argument(s)?
# string



#3: Write a method named square that takes in one number, and returns the square of that number

def square(num)
num * num
end

square(2)
# What is the return value of your method?
# 4
# # How many arguments did you pass your method?
# 1
# # What data type was your argument(s)?
# Integer



#4: Write a method named greet_person that takes in 3 strings, a first, middle, and last name, and print outs the sentence of the entire string
def greet_person(nam1, nam2, nam3)
  puts"How is your day, #{nam1} #{nam2} #{nam3}?"
end

greet_person("Jingle", "Himer", "Smith")

# What is the return value of your method?
#How is your day, Jingle Himer Smith?
# How many arguments did you pass your method?
# 2
# What data type was your argument(s)?
# string 
