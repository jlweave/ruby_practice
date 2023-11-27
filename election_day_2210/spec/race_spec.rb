require './lib/candidate'
require './lib/race'

RSpec.describe Race do
  before (:each) do
    @race = Race.new("Texas Governor")
    @candidate1 = Candidate.new({name: "Diana D", party: :democrat})
    @candidate2 = Candidate.new({name: "Roberto R", party: :republican})
  end

  describe 'initialize' do
    it 'exists and has readable attributes' do
      expect(@race).to be_a(Race)
      expect(@race.office).to eq("Texas Governor")
    end
  end 

  # describe '#add_candidate' do
  #   it 'can add candidates to the arrray' do
  #     @race.register_candidate!(@candidate1)
  #     @race.register_candidate!(@candidate2)

  #     expect(@race.candidates).to eq([@candidate1, @candidate2])
  #   end
  # end

  describe '#add_candidate' do
    it 'can add candidates to the array' do
      @candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})
      expect(@candidate1).to be_a(Candidate)
      expect(@candidate1.name).to eq('Diana D')
      expect(@candidate1.party).to eq(:democrat)
      @candidate2 = @race.register_candidate!({name: "Roberto R", party: :republican})

      expect(@race.candidates).to eq([@candidate1, @candidate2])
    end
  end
end