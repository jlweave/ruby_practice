class Race
  attr_reader :office,
              :candidates

  def initialize(office)
    @office = office
    @candidates = []
  end

  # def register_candidate!(name)
  #   @candidates << name
  # end

  def register_candidate!(info)
    candidate = Candidate.new({name: info[:name],
      # require 'pry'; binding.pry
                               party: info[:party]})
    @candidates << candidate
    candidate
  end
end
