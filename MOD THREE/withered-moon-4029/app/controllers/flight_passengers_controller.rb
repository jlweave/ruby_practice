class FlightPassengersController < ApplicationController

  def destroy
    # require 'pry';binding.pry
    @remove_combo = FlightPassenger.find_by(flight_id: params[:flight_id], passenger_id: params[:id])
    @remove_combo.destroy
    redirect_to flights_path
  end
end