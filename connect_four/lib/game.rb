require './lib/board'
require './lib/piece'
require './lib/turn'
require './lib/null_piece'
require './lib/game'
require './lib/win_check'
require './lib/validity'
require './lib/menu'
require './lib/player'

class Game
  attr_reader :welcome_message,
              :game_state,
              :board,
              :win_check,
              :turns,
              :validity

  def initialize(config = Menu.new.start)
    @config = config
    @board = Board.new(@config["board_width"], @config["board_height"])
    @win_check = WinCheck.new(@board, @config["win_condition"])
    @validity = Validity.new(@board)
    @game_state = 'none'
    @turns = []    
  end

  def add_turn(turn)
    @turns << turn
  end

  def get_current_player(player_1, player_2)
    if @turns.length.even?
      player_1
    else @turns.length.odd?
      player_2
    end
  end

  def create_player_2
    if @config["number_of_players"] == 2
      player_2_name = @config["player_names"][1]
    else
      player_2_name = "Computer"
    end
    player_2 = Player.new(get_player_type, 'O', player_2_name)
  end

  def get_player_type
    if @config["number_of_players"] == 1
      "computer"
    else 
      "player"
    end
  end

  def play
    player_1 = Player.new('player', 'X', @config['player_names'][0])
    player_2 = create_player_2
    puts @board.display_board
    while @game_state == 'none' do
      turn = Turn.new(get_current_player(player_1, player_2))
      add_turn(turn)
      player_input = turn.get_checked_input(@validity)
      piece = @board.place_piece(turn.symbol, player_input)
      puts @board.display_board
      @game_state = 'tie' if @board.full_board?
      change_game_state(piece)
    end
    end_game_message
  end

  def change_game_state(piece)
    if @win_check.win?(piece)
      if piece.symbol == 'X' 
        @game_state = 'player'
     else
        @game_state = 'player_2'
     end
    end
  end

  def end_game_message
    #add win_check.game_state
    if @game_state == 'player'
      puts "#{@turns.last.player.name} has won!"
    elsif @game_state == 'player_2'
      puts "#{@turns.last.player.name} has won!"
    else 
      puts "It's a tie, no one wins."
    end
    game = Game.new
    game.play
  end

end