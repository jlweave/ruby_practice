class BikeClub
  attr_reader :name,
              :bikers

  def initialize(name)
    @name = name
    @bikers = []
  end

  def add_bikers(biker)
    @bikers << biker
  end

  def most_rides
    @bikers.max_by do |biker|
      biker.total_logged_rides
    end
  end

  def fastest_biker
    @bikers.min_by do |biker|
      biker.personal_record(biker)
    end
  end

  def is_eligible?(biker)
    @bikers.find_all do |biker|
      biker.eligible?(biker)
      # do |ride, times|
      #   ride.eligible?(biker)
      # end
    end
  end 
end
