# Write a class called Unicorn
# it should have a dynamic name attribute
# it should have a color attribute, that is silver by default
# it should have a method called "say" that returns whatever string is passed in, with "*~*" at the beginning and end of the string
class Unicorn
  def initialize(name, color)
        @name = name
        @color = "silver"
    end

  def say
    puts "*~* My name is #{@name}, what's yours?*~*"
    end
end

unicorn1 = Unicorn.new("Sparkles", "silver")
unicorn1.say

#  Write a class called Vampire
#  it should have a dynamic name attribute
#  it should have a pet attribute, that is a bat, by default BUT it could be dynamic if info is passed in initially
#  it should have a thirsty attribute, that is true by default
#  it should have a drink method. When called, the thirsty attribute changes to false

class Vampire
  attr_reader :pet
  def initialize(location)
    @pet = "bat"
    @location = location
    @thirsty = true
  end

  def where_location
  puts "I live in #{@location}, where I have a big castle."
  end

  def pet_change(new_pet)
    @pet = new_pet
  end

  def drink()
    @thirsty = false
    if @thirsty == false
      puts "Im not thirsty"
    else
      puts "Im still thirsty"
    end
  end
end

vampire1 = Vampire.new("Transylvania")
p vampire1.where_location
vampire1.pet_change("spider")
p vampire1.pet
vampire1.drink()



#  Write a Dragon class
#  it should have a dynamic name attribute (string)
#  it should have a dynamic rider attribute (string)
#  it should have a dynamic color attribute (string)
#  it should have a is_hungry attribute that is true by default
#  it should have a eat method. If the dragon eats 4 times, it is no longer hungry
class Dragon
  attr_reader :is_hungry
  def initialize()
    @name = "Larry"
    @rider = "Steve"
    @color = "purple"
    @is_hungry = true
    @hunger = 0
  end

    def eat()
      @hunger += 1
      if @hunger > 3
        @is_hungry = false
        puts "I am not hungry"
        puts @hunger
      else
        puts "I am very hungry"
        puts @hunger
      end
    end
end

#  Write a Hobbit class
#  it should have a dynamic name attribute (string)
#  it should have a dynamic disposition attribute (string)
#  it should have an age attribute that defaults to 0
#  it should have a celebrate_birthday method. When called, the age increases by 1
#  it should have an is_adult attribute (boolean) that is false by default. once a Hobbit is 33, it should be an adult
#  it should have an is_old attribute that defaults to false. once a Hobbit is 101, it is old.
#  it should have a has_ring attribute. If the Hobbit's name is "Frodo", true, if not, false.

class Hobbit
  # attr_reader :name
  # attr_reader :has_ring
  def initialize()
    @name = "Frodo"
    @disposition = "happy"
    @age = 0
    @is_adult = false
    @is_old = false
    @has_ring = false
  end

    def celebrate_birthday()
      @age += 1
      puts @age
      if @age >= 33
        @is_adult = true
        puts "I'm an adult!"
      end

      if @age >= 101
        @is_old =true
        puts "I'm old as dirt."
      end

    end

  def has_it()
    if @name == "Frodo"
      @has_ring = true
      puts "I have the ring"
    else
      @has_ring = false
      puts " I don't have the ring."
    end
  end

end


hobbit1 =Hobbit.new()
hobbit1.celebrate_birthday()
hobbit1.has_it()
