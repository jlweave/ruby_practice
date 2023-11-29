require './lib/player'
require './lib/team'

RSpec.describe Team do
  before (:each) do
    @team = Team.new("Dodgers", "Los Angeles")
    @player_1 = Player.new("Michael Palledorous" , 1000000, 36)
    @player_2 = Player.new("Kenny DeNunez", 500000, 24)
    @player_3 = Player.new("Alan McClennan", 750000, 48)
    @player_4 = Player.new("Hamilton Porter", 100000, 12)
  end

  describe '#initialize' do
    it 'exists and has readable attributes' do
      expect(@team).to be_a(Team)
      expect(@team.name).to eq("Dodgers")
      expect(@team.location).to eq("Los Angeles")
    end
  end

  describe '#roster and players' do
    it 'can add players to an array' do
      expect(@team.roster).to eq([])
      expect(@team.player_count).to eq(0)
      @team.add_player(@player_1)
      @team.add_player(@player_2)
      expect(@team.roster).to eq([@player_1, @player_2])
      expect(@team.player_count).to eq(2)
    end
  end

  describe '#long_term_players' do
    it 'can return the players that have contracts > 24 mo' do
      @team.add_player(@player_1)
      @team.add_player(@player_2)
      @team.add_player(@player_3)
      @team.add_player(@player_4)

      expect(@team.long_term_players).to eq([@player_1, @player_3])
    end
  end

  describe '#short_term_players' do
    it 'can return players that have contracts < 24 mo' do
      @team.add_player(@player_1)
      @team.add_player(@player_2)
      @team.add_player(@player_3)
      @team.add_player(@player_4)

      expect(@team.short_term_players).to eq([@player_2, @player_4])
    end
  end

  describe 'total_value' do
    it 'can add up the sum of all the players cost' do
      @team.add_player(@player_1)
      @team.add_player(@player_2)
      @team.add_player(@player_3)
      @team.add_player(@player_4)

      expect(@team.total_value).to eq(85200000)
    end
  end

  describe 'details' do
    it 'can return a hash of the team total calue and player count' do
      @team.add_player(@player_1)
      @team.add_player(@player_2)
      @team.add_player(@player_3)
      @team.add_player(@player_4)

      expect(@team.details).to eq({"total_value" => 85200000, "player_count" => 4})
    end
  end

  describe 'average_cost_of_player' do
    it 'can can return the average cost of players in a string' do
      @team.add_player(@player_1)
      @team.add_player(@player_2)
      @team.add_player(@player_3)
      @team.add_player(@player_4)

      expect(@team.average_cost_of_player).to eq("$21,300,000")
    end
  end

  describe '#player_by_last_name' do
    it 'can return the last name of players in a string' do
      @team.add_player(@player_2)
      @team.add_player(@player_3)
      @team.add_player(@player_1)
      @team.add_player(@player_4)

      expect(@team.player_by_last_name).to eq("DeNunez, McClennan, Palledorous, Porter")
    end
  end
end