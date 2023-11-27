class Team
  attr_reader :name,
              :location,
              :roster,
              :player_count

  def initialize(name, location, player_count = 0)
    @name = name
    @location = location
    @roster = []
    @player_count = player_count
  end

  def add_player(player)
    @roster << player
    @player_count += 1
  end

  def total_value
    @roster.sum do |player|
      player.total_cost
    end
  end

  def long_term_players
    long_term = []
    @roster.each do |player|
     if  player.contract_length > 24
      long_term << player
     end
    end
    long_term
  end

  def short_term_players
    short_term = []
    @roster.each do |player|
     if  player.contract_length < 25 
      short_term << player
     end
    end
    short_term
  end

  def details
    team_details = {
                    'total_value' => total_value,
                    'player_count' => player_count
    }
  end

  def average_cost_of_player
    number = total_value/ @player_count
    #changes it to a string(.to_s)reverses(.reverse)place comma every three(.gsub(\d{3}= 3 digits(?=\d)unknown number, place comma'\\1,'))
    #reverse it back(.reverse) then add to "#{}"
    "$#{number.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse}"
  end

  def player_by_last_name
    @roster.map{|player|player.last_name.to_s}.join(", ")
  end
end