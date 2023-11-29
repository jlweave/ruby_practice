require './lib/candidate'
require './lib/race'
require './lib/election'

RSpec.describe Election do
  before (:each) do
    @election = Election.new('2022')
    @race1 = Race.new("Virginia District 4 Representative")
    @race2 = Race.new("Texas Governor")
    @candidate1 = @race1.register_candidate!({name: "Diana D", party: :democrat})
    @candidate2 = @race1.register_candidate!({name: "Roberto R", party: :republican})
    @candidate3 = @race2.register_candidate!({name: "Diego D", party: :democrat})
    @candidate4 = @race2.register_candidate!({name: "Rita R", party: :republican})
    @candidate5 = @race2.register_candidate!({name: "Ida I", party: :independent})
    # @candidate1 = Candidate.new({name: "Diana D", party: :democrat})
    # @candidate2 = Candidate.new({name: "Roberto R", party: :republican})
    # @candidate3 = Candidate.new({name: "Diego D", party: :democrat})
    # @candidate4 = Candidate.new({name: "Rita R", party: :republican})
    # @candidate5 = Candidate.new({name: "Ida I", party: :independent})
    
  end

  describe '#initialize' do
    it 'exists and has readable attributes' do
      expect(@election).to be_a(Election)
      expect(@election.year).to eq('2022')
    end
  end

  describe '#add_race' do
    it 'can add a race to the races array' do
      @election.add_race(@race1)
      @election.add_race(@race2)

      expect(@election.races).to eq([@race1, @race2])
      expect(@election.candidates).to eq([@candidate1, @candidate2, @candidate3, @candidate4, @candidate5])
    end
  end

  describe '#vote_counts' do
    it 'can talley up the vote for a candidate' do
      @candidate1 = @race1.register_candidate!({name: "Diana D", party: :democrat})
      @candidate2 = @race1.register_candidate!({name: "Roberto R", party: :republican})
      @candidate3 = @race2.register_candidate!({name: "Diego D", party: :democrat})
      @candidate4 = @race2.register_candidate!({name: "Rita R", party: :republican})
      @candidate5 = @race2.register_candidate!({name: "Ida I", party: :independent})
      @election.add_race(@race1)
      @election.add_race(@race2)
      4.times {@candidate1.vote_for!}
      1.times {@candidate2.vote_for!}
      10.times {@candidate3.vote_for!}
      6.times {@candidate4.vote_for!}
      6.times {@candidate5.vote_for!}

      expect(@election.vote_counts).to eq({"Diana D"=>4, 
                                           "Roberto R"=>1, 
                                           "Diego D"=>10, 
                                           "Rita R"=>6, 
                                           "Ida I"=>6})
    end
  end
end