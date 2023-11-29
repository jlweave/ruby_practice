class Turn
  attr_reader :player,
              :type,
              :symbol

  def initialize(player)
    @player = player
    @type = @player.type
    @symbol = @player.symbol
  end

  def get_checked_input(validity_checker)
    player_input = get_input
    if validity_checker.validity_checks(player_input)
      player_input
    else
       puts "That is an invalid choice, please try again." if @type == "player"
      get_checked_input(validity_checker)
    end
  end

    private

    def get_computer_input
      ("A".."Z").to_a.sample
    end
  
    def get_human_input
      puts 'Choose a valid location to place your piece.'
      gets.chomp.strip.upcase
    end
  
    def get_input
      if @type == 'player'
        get_human_input
      else
        get_computer_input
      end
    end
end



