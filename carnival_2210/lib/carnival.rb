class Carnival

  def initialize
    @all_rides = []
  end

  def add_ride(ride)
    @all_rides << ride
    # require 'pry'; binding.pry
  end

  def total_rev_from_all_rides
    total = 0
    @all_rides.each do |rides|
      # require 'pry'; binding.pry
      total += rides.total_revenue
    end
    total
  end

  def most_popular_ride
    number = 0
    @all_rides.each do |ride|
      require 'pry'; binding.pry
      number += ride.rider_log.count
    end
    number
  end
end