class AstronautsController < ApplicationController
  def index
    @astronauts = Astronaut.all
    # require 'pry'; binding.pry
  end
end