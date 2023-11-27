# Instructions
* Fork this Repository
* Clone your forked repo
* Complete the activity Below
* Push your solution to your repo
* Submit a Pull Request from your repo to this repo
* Put your name in your PR!

# Iteration 1

For iteration 1, we have created all of the tests you will need
unskip tests one by one (by removing 'skip') and make each pass before
moving on to the next test. The tests will model the following interaction pattern:

```ruby
pry(main)> require './lib/shelter'
#=> true

pry(main)> shelter = Shelter.new("Denver Animal Shelter", 3)
=> #<Shelter:0x00007fed7c11dbd8 @capacity=3, @name="Denver Animal Shelter", @pets=[]>

pry(main)> shelter.name
=> "Denver Animal Shelter"

pry(main)> shelter.capacity
=> 3

pry(main)> shelter.pets
=> []
```

# Iteration 2
For iteration 2, we have created all of the tests you will need  
unskip tests one by one, making each pass before moving on the the next test.
The tests will model the interaction pattern below.

`call_pets` should return an array of pet names followed by an `!`.

```ruby
pry(main)> require './lib/shelter'
#=> true

pry(main)> shelter =Shelter.new("Denver Animal Shelter", 3)
=> ##<Shelter:0x00007fed7c11dbd8 @capacity=3, @name="Denver Animal Shelter", @pets=[]>

pry(main)> shelter.add_pet('Salem')
pry(main)> shelter.add_pet('Beethoven')
pry(main)> shelter.add_pet('Spot')

pry(main)> shelter.patrons
=> ["Salem", "Beethoven", "Spot"]

shelter.call_pets
=> ["Salem!", "Beethoven!", "Spot!"]

```

# Iteration 3
Now, it is time for you to write your own tests! Follow the interaction pattern
below to write one test, make that test pass, and move on to the next test.
You will have at minimum, one test per new method.
* The method `over_capacity?` will return true or false if the venue has more patrons
than the capacity

```ruby
pry(main)> require './lib/shelter'
#=> true

pry(main)> shelter =Shelter.new("Denver Animal Shelter", 3)
=> ##<Shelter:0x00007fed7c11dbd8 @capacity=3, @name="Denver Animal Shelter", @pets=[]>

pry(main)> shelter.add_pet('Salem')
pry(main)> shelter.add_pet('Beethoven')

pry(main)> shelter.over_capacity?
=> false

pry(main)> shelter.add_pet('Spot')
pry(main)> shelter.add_pet('Jonesy')

pry(main)> shelter.over_capacity?
=> true

```


# Iteration 4
Now, it is time for you to write your own tests! Follow the interaction pattern
below to write one test, make that test pass, and move on to the next test.
You will have at minimum, one test per new method.
* The `adopt` method will continue to remove pets from the shelter until it is
no longer over capacity

```ruby
pry(main)> require './lib/shelter'
#=> true

pry(main)> shelter =Shelter.new("Denver Animal Shelter", 3)
=> ##<Shelter:0x00007fed7c11dbd8 @capacity=3, @name="Denver Animal Shelter", @pets=[]>

pry(main)> shelter.add_pet('Salem')
pry(main)> shelter.add_pet('Beethoven')
pry(main)> shelter.add_pet('Spot')
pry(main)> shelter.add_pet('Jonesy')

pry(main)> shelter.adopt

pry(main)> shelter.over_capacity?
=> false

```
