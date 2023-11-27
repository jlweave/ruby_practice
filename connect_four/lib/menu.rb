class Menu

  attr_reader :config, :welcome_message

  def initialize()
    @welcome_message = "Welcome to Connect MORE\n " + "Enter p to play. Enter q to quit."
    @config = {
      "number_of_players" => 1, 
      "board_height" => 6,
      "board_width" => 7,
      "win_condition" => 3,
      "player_names" => []
    }
  end

  def start 
    puts @welcome_message
    menu_commands(get_main_menu_input)
    @config
  end

  private

  def menu_commands(letter)
      if letter == 'p'
        @config["number_of_players"] = get_number_of_players
        puts "Player One: Please enter your name"
        get_player_name
        if @config["number_of_players"] == 2 
          puts "Player Two: Please enter your name"
          get_player_name
        end
        @config["board_height"] = get_new_board_height 
        @config["board_width"] = get_new_board_width
        @config["win_condition"] = get_new_win_condition  
      elsif letter == 'q'
        puts 'You chose to quit the game, good-bye!'
        exit!
      else
        puts 'Invaild entry, please try again. Enter p to play. Enter q to quit.'
        menu_commands(get_main_menu_input)
      end
  end

  def get_main_menu_input
    gets.chomp.strip.downcase
  end

  def get_number_of_players
    puts "Please enter 1 for a game vs the computer, or 2 for a game against another person.\n"
    input = get_main_menu_input.to_i
    if input == 1 || 2
      input
    else
      puts "Invalid input."
      get_number_of_players
    end
  end

  def get_player_name
    @config["player_names"].push(gets.chomp)
  end

  def get_new_board_width
    puts "Please enter a number, greater than 0 and no greater than 26, to set a custom width for the board.\n" #Enter 'd' for default width.\n
    input = get_main_menu_input
    input = input.to_i
    if (0 < input.to_i) && (input.to_i < 27)
      input
    else
      puts "Invalid input."
      get_new_board_width
    end
  end

  def get_new_board_height
    puts "Please enter a number to set a custom height for the board.\n" #Enter 'd' for default height.
    input = get_main_menu_input
    
    input = input.to_i
    if (input < 99) && (input > 0)
      input
    else
      puts "Invalid input."
      get_new_board_height
    end
  end

  def get_new_win_condition
    puts "Please enter the number of pieces in a row (10 or less) that counts as a win.\n" #Enter 'd' for default(4).
    input = get_main_menu_input
    if input.to_i < 11
      input.to_i - 1
    elsif input == 'd'
    else
      puts "Invalid input."
      get_new_win_condition
    end
  end
end