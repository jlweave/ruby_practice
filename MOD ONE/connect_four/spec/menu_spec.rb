require './lib/menu'

describe Menu do
  describe '#initialize'do
    it 'has a welcome_message' do
      menu = Menu.new
      expect(menu.welcome_message).to eq "Welcome to Connect MORE\n " + "Enter p to play. Enter q to quit."
    end

    it 'has a config hash' do
      menu = Menu.new
      expect(menu.config).to be_a Hash
    end
  end

  describe '#start' do
  #first attempt at using stubs
  #this feels unhelpful and uninformative 
    it 'returns a config hash' do
      menu = Menu.new
      
      allow(menu).to receive(:start).and_return ({
        "number_of_players" => 1, 
        "board_height" => 6,
        "board_width" => 7,
        "win_condition" => 3,
        "player_names" => []
      })

      expect(menu.start).to be == {
        "number_of_players" => 1, 
        "board_height" => 6,
        "board_width" => 7,
        "win_condition" => 3,
        "player_names" => []
      }
    end

    it 'can return a different config hash' do
      menu = Menu.new
      
      allow(menu).to receive(:start).and_return ({
        "number_of_players" => 2, 
        "board_height" => 13,
        "board_width" => 4,
        "win_condition" => 4,
        "player_names" => ['Fred', 'Tim']
      })

      expect(menu.start).to be == {
        "number_of_players" => 2, 
        "board_height" => 13,
        "board_width" => 4,
        "win_condition" => 4,
        "player_names" => ['Fred', 'Tim']
      }
    end
  end


end







