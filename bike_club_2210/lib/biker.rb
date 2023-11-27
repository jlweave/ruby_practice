class Biker
  attr_reader :name,
              :max_distance,
              :rides,
              :acceptable_terrain

  def initialize(name, max_distance)
    @name = name
    @max_distance = max_distance
    @rides = {}
    @acceptable_terrain = []
  end

  def learn_terrain!(terrain)
    @acceptable_terrain << terrain
  end

  def log_ride(ride, times)
    if eligible?(ride)
      if @rides[ride].nil? 
        @rides[ride] = [times]
      else
        @rides[ride] << times
      end
    end
  end

  def personal_record(ride)
    return false if @rides[ride].nil?
      @rides[ride].min
  end

  def total_logged_rides 
    total = 0
    @rides.each do |ride, time|
      total += @rides[ride].count
    end
    total
  end

  def eligible?(ride)
    return true if ride.total_distance < @max_distance && @acceptable_terrain.include?(ride.terrain)
    false
  end
end