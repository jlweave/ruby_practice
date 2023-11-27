# Sports Ball

## Instructions

* Fork this Repository
* Clone YOUR fork
* Complete the activity below
* Push your solution to a fork
* Submit a pull request from your repository to the `turingschool-examples` repository
* Make sure to put your name in your PR!

## Iteration 1
 
Start with the existing tests, and then use TDD to create a `Player` class that responds to the 
following interaction pattern. You are expected to write your own tests for the `set_nickname!` and `nickname` methods.

(Where you see something like `#<Playerr:0x00007fccd30375f8...>`, this is
shorthand for a full player object with that object identifier - we have
replaced any attributes with `...` for readability.)

Notes: Contract length is in months, and the total cost is the contract length multiplied by the monthly cost.

```ruby
pry(main)> require './lib/player'
#=> true

pry(main)> player = Player.new("Michael Palledorous" , 1000000, 36)
#=> #<Player:0x00007fa53b9ca0a8...>

pry(main)> player.first_name
#=> "Michael"

pry(main)> player.last_name
#=> "Palledorous"

pry(main)> player.monthly_cost
#=> 1000000

pry(main)> player.contract_length
#=> 36

pry(main)> player.total_cost
#=> 36000000

pry(main)> player.nickname
#=> nil

pry(main)> player.set_nickname!("Squints")

pry(main)> player.nickname
#=> "Squints
```

## Iteration 2

Use TDD to create a `Team` class that responds to the following interaction
pattern:

(Where you see something like `#<Team:0x00007fccd30375f8...>`, this is
shorthand for a full team object with that object identifier - we have
replaced any attributes with `...` for readability.)

```ruby
pry(main)> require './lib/player'
#=> true

pry(main)> require './lib/team'
#=> true

pry(main)> team = Team.new("Dodgers", "Los Angeles")
#=> #<Team:0x00007fccd30375f8...>

pry(main)> team.roster
#=> []

pry(main)> team.player_count
#=> 0

pry(main)> player_1 = Player.new("Michael Palledorous" , 1000000, 36)
#=> #<Player:0x00007fa53b9ca0a8...>

pry(main)> player_2 = Player.new("Kenny DeNunez", 500000, 24)
#=> #<Player:0x00007fccd2985f48...>

pry(main)> team.add_player(player_1)

pry(main)> team.add_player(player_2)

pry(main)> team.roster
#=> [#<Player:0x00007fa53b9ca0a8...>, #<Player:0x00007fccd2985f48...>]

pry(main)> team.player_count
#=> 2
```

## Iteration 3

Use TDD to update your `Team` class so that it responds to the following interaction pattern: 

* Player is considered a long term player if their contract length is greater than two years.
* Player is considered a short term player if their contract length is two years or less.
* total_value is the total cost of all of the players.

```ruby
pry(main)> require './lib/player'
#=> true

pry(main)> require './lib/team'
#=> true

pry(main)> team = Team.new("Dodgers", "Los Angeles")
#=> #<Team:0x00007fccd30375f8...>

pry(main)> player_1 = Player.new("Michael Palledorous" , 1000000, 36)
#=> #<Player:0x00007fa53b9ca0a8...>

pry(main)> player_2 = Player.new("Kenny DeNunez", 500000, 24)
#=> #<Player:0x00007fccd2985f48...>

pry(main)> player_3 = Player.new("Alan McClennan", 750000, 48)
#=> #<Player:0x00007fccd383c2d0...>

pry(main)> player_4 = Player.new("Hamilton Porter", 100000, 12)
#=> #<Player:0x00007fccd297dc30...>

pry(main)> team.add_player(player_1)

pry(main)> team.add_player(player_2)

pry(main)> team.add_player(player_3)

pry(main)> team.add_player(player_4)

pry(main)> team.long_term_players
#=> [#<Player:0x00007fa53b9ca0a8...>, #<Player:0x00007fccd383c2d0...>]

pry(main)> team.short_term_players
#=> [#<Player:0x00007fccd297dc30...>, #<Player:0x00007fccd2985f48...>]

pry(main)> team.total_value
#=> 85200000

pry(main)> team.details
#=> {"total_value" => 85200000, "player_count" => 4}

```

## Iteration 4

Use TDD to update your `Team` class so that it responds to the following interaction pattern:

* Players sorted by last name should be in descending alphabetical order.


```ruby
pry(main)> require './lib/player'
#=> true

pry(main)> require './lib/team'
#=> true

pry(main)> team = Team.new("Dodgers", "Los Angeles")
#=> #<Team:0x00007fccd30375f8...>

pry(main)> player_1 = Player.new("Michael Palledorous" , 1000000, 36)
#=> #<Player:0x00007fa53b9ca0a8...>

pry(main)> player_2 = Player.new("Kenny DeNunez", 500000, 24)
#=> #<Player:0x00007fccd2985f48...>

pry(main)> player_3 = Player.new("Alan McClennan", 750000, 48)
#=> #<Player:0x00007fccd383c2d0...>

pry(main)> player_4 = Player.new("Hamilton Porter", 100000, 12)
#=> #<Player:0x00007fccd297dc30...>

pry(main)> team.add_player(player_1)

pry(main)> team.add_player(player_2)

pry(main)> team.add_player(player_3)

pry(main)> team.add_player(player_4)

pry(main)> team.average_cost_of_player
#=> "$21,300,000"

pry(main)> team.players_by_last_name
#=> "DeNunez, McClennan, Palledorous, Porter"
```
