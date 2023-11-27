require './lib/board'
require './lib/piece'
require './lib/turn'
require './lib/null_piece'
require './lib/game'
require './lib/win_check'

RSpec.describe Game do 
  describe '#initialize' do
    it 'exists' do
      game = Game.new({
        "number_of_players" => 1, 
        "board_height" => 6,
        "board_width" => 7,
        "win_condition" => 3,
        "player_names" => []
      })
      expect(game).to be_a(Game)
    end
  end



    it 'has game_state with a default value of none' do
      game = Game.new({
        "number_of_players" => 1, 
        "board_height" => 6,
        "board_width" => 7,
        "win_condition" => 3,
        "player_names" => []
      })
      expect(game.game_state).to eq('none')
    end
  
    it 'has a board' do
      game = Game.new({
        "number_of_players" => 1, 
        "board_height" => 6,
        "board_width" => 7,
        "win_condition" => 3,
        "player_names" => []
      })
      expect(game.board).to be_a(Board)
    end

    it 'has a empty turns array' do
      game = Game.new({
        "number_of_players" => 1, 
        "board_height" => 6,
        "board_width" => 7,
        "win_condition" => 3,
        "player_names" => []
      })
      expect(game.turns).to eq([])
    end

    it 'has a validity' do
      game = Game.new({
        "number_of_players" => 1, 
        "board_height" => 6,
        "board_width" => 7,
        "win_condition" => 3,
        "player_names" => []
      })
      expect(game.validity).to be_a(Validity)
    end

    it 'has a win_check' do
      game = Game.new({
        "number_of_players" => 1, 
        "board_height" => 6,
        "board_width" => 7,
        "win_condition" => 3,
        "player_names" => []
      })
      expect(game.win_check).to be_a(WinCheck)
    end
  end

  describe '#add_turn' do
    it 'can add a turn to the turns array' do
      game = Game.new({
        "number_of_players" => 1, 
        "board_height" => 6,
        "board_width" => 7,
        "win_condition" => 3,
        "player_names" => []
      })
      player = Player.new('player', 'O', 'Tom')
      turn = Turn.new(player)
      game.add_turn(turn)

      expect(game.turns).to eq([turn])
    end
  end

  describe '#get_current_player' do
    it 'can return a player for turn' do
      game = Game.new({
        "number_of_players" => 1, 
        "board_height" => 6,
        "board_width" => 7,
        "win_condition" => 3,
        "player_names" => []
      })
      
      player_1 = Player.new('player', 'X', 'Tom')
      player_2 = Player.new('player', 'O', 'Fred')
      current_player = game.get_current_player(player_1, player_2)

      expect(current_player).to eq(player_1)
    end

  describe '#change_game_state' do
    it 'will change game state to player if the winning piece symbol is X' do
      game = Game.new({
        "number_of_players" => 1, 
        "board_height" => 6,
        "board_width" => 7,
        "win_condition" => 3,
        "player_names" => []
      })
      game.board.place_piece('X', 'A')
      game.board.place_piece('X', 'A')
      game.board.place_piece('X', 'A')
      piece = game.board.place_piece('X', 'A')
      game.change_game_state(piece)
      expect(game.game_state).to eq('player')
    end

    it 'will change game state to computer if the winning piece symbol is O' do
      game = Game.new({
        "number_of_players" => 1, 
        "board_height" => 6,
        "board_width" => 7,
        "win_condition" => 3,
        "player_names" => []
      })
      game.board.place_piece('O', 'A')
      game.board.place_piece('O', 'A')
      game.board.place_piece('O', 'A')
      piece = game.board.place_piece('O', 'A')
      game.change_game_state(piece)
      expect(game.game_state).to eq('player_2')
    end

    it 'will do nothing if the piece is not a winning play' do
      game = Game.new({
        "number_of_players" => 1, 
        "board_height" => 6,
        "board_width" => 7,
        "win_condition" => 3,
        "player_names" => []
      })

      player_1 = Player.new('player', 'X', 'Tom')

      turn = Turn.new(player_1)
      piece = game.board.place_piece(turn.symbol, 'A')
      game.change_game_state(piece)

      expect(game.game_state).to eq('none')
    end
  end


    


end
