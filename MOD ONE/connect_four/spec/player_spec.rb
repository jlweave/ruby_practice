require './lib/player'
require './lib/game'
require './lib/piece'
require './lib/turn'
require './lib/validity'
require './lib/win_check'
require './lib/null_piece'

RSpec.describe Player do
  describe 'initialize' do
    it 'exists' do
      player = Player.new('player', 'X', 'Frank')

      expect(player).to be_a(Player)
    end

    it 'can have a different type' do
      player = Player.new('computer', 'O', 'Computer')

      expect(player.type).to eq('computer')
    end
 
    it 'is assigned a symbol' do
      player = Player.new('computer', 'O', 'Computer')
      
      expect(player.symbol).to eq('O')
    end
  
    it 'can return a name for player' do
      player = Player.new('computer', 'O', 'Computer')

      expect(player.name).to eq('Computer')
    end
  
  end




end