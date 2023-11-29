class Ride
  attr_reader :name,
              :distance,
              :terrain,
              :info

  def initialize(info) 
    @name = info[:name]
    @distance = info[:distance]
    @terrain = info[:terrain]
    @loop = info[:loop]
  end

  def loop?
    @loop
  end

  def total_distance
    if @loop == false
      @distance * 2
    else
      @distance
    end
  end
end