class MoviesController < ApplicationController
  def show
    @movies = Movie.find(params[:id])
    # require 'pry'; binding.pry
  end

end