class Venue
  attr_reader :name, :capacity, :patrons
  def initialize(name, patrons)
    @name = "Bluebird"
    @capacity = 4
    @patrons = []
  end

  def add_patron(patron)
    @patrons << patron
  end

  def yell(add_patron)
    @patrons << yell_at_patrons.upcase
  end
end
