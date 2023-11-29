class AirlinesController < ApplicationController
  def show
    # require 'pry';binding.pry
    @airline = Airline.find(params[:id])
    @adults = @airline.adult_passengers_only
  end

end