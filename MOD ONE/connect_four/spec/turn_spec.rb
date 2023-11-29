require './lib/turn'

RSpec.describe Turn do
  describe '#initialize' do
    it 'exists' do
      player = Player.new('player', 'X', 'Fred')
      turn = Turn.new(player)
      expect(turn).to be_a(Turn)
    end

    it 'has a symbol' do
      player = Player.new('player', 'X', 'Fred')
      turn = Turn.new(player)
      expect(turn.symbol).to eq('X')
    end
  end

  describe '#get_human_input' do
    #just check that it can be called, not the input due to it being human choice
    it 'responds to method call' do
      player = Player.new('player', 'X', 'Fred')
      turn = Turn.new(player)
      expect(turn.respond_to?(:get_human_input))
    end
  end

  describe '#get_computer_input' do
    it 'responds to method call' do
      player = Player.new('Computer', 'O', 'Fred')
      turn = Turn.new(player)
      expect(turn.respond_to?(:get_computer_input))
    end
  end

end