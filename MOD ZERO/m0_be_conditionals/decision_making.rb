# This exercise file is a little different from the others you have seen so far. Read carefully!
# Below is a dynamic story that is created based on the value of three variables: door_choice, bear_clothing, bear_choice.
# Spend some time changing the variables and running the file to see how the story changes.


door_choice = 1
bear_clothing = ""
bear_choice = 1

puts "You enter a dark room with two doors. Do you go through #1 or #2?"

if door_choice == 1
  bear_clothing = "hat"
else
  bear_clothing = "scarf"
end

puts "You see a bear putting on a " + bear_clothing
puts "It looks like that " + bear_clothing + " is too small for the bear, do you..."

puts "1. Offer your own to the bear?"
puts "2. Point it out to the bear?"
puts "3. Make a dash for the next room?"

if bear_choice == 1
  "You offer the bear your " + bear_clothing + " and the bear shows you a secret passage out!"
elsif bear_choice == 2
  "You tell the bear the " + bear_clothing + " is too small and it starts to cry!"
elsif bear_choice == 3
  "You run as fast as you can into the next room. It's full of snakes!"
else
  "You stay with the bear and become it's best friend!"
end


# Questions
# 1. In English, using technical vocabulary, describe what is happening between lines 12 and 16.
# Lines 12-16 are a if else statement. It is where the code is run and seeing which conditions are being met.
# Based on which conditions that are met will deside what bear_clothing will change to.
# In this case it is asking if the door_choice is equal to 1 . Because the variable door_choice is eqaul to one it will
# change the variable bear_clothing = "" to bear_clothing = "hat"

# 2. What variable has a new value assigned to it after the first if statement executes?
# bear_clothing is changed to hat after running the first code.

# 3. If you changed the variable door_choice to equal 3, what would the bear_clothing value be?
#If the door_choice was changed to 3 that would change bear_clothing to bear_clothing = "scarf"

# 4. In English, using technical vocabulary, describe what is happening between lines lines 25 and 33.
# This is an elsif statement where the code will run through all conditions until it is met and then end the code.

# 5. If you changed the variable bear_choice to equal 3, what will be the final outcome be?
# If the bear_choice was 3 the print out would be "You run as fast as you can into the next room. It's full of snakes!"

# 6. If you changed the variable door_choice to equal 1, and the variable bear_choice to equal 2, what will be the final outcome be?
# if door_choice is 1 then the bear_clothing will be a hat and if the bear choice is eqaul to 2 the final out come will be
# "You tell the bear the hat is too small and it starts to cry!"

# 7. What is your favorite ending?
#  "You stay with the bear and become it's best friend!"
