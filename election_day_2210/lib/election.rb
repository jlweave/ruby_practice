class Election
  attr_reader :year,
              :races,
              :candidates

  def initialize(year)
    @year = year
    @races = []
    @candidates = []
  end

  def add_race(race)
    @races << race
    race.candidates.each do |candidate|
      @candidates << candidate
    end
  end

  def vote_counts
    voting_counts = {}
   
    @candidates.each do |candidate|
      person = candidate.name
        voting_counts[person] = candidate.votes
      require 'pry'; binding.pry
    
    end
    
  end
end
