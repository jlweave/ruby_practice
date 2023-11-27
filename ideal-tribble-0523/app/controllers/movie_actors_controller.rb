class MovieActorsController < ApplicationController
  def create
    require 'pry'; binding.pry
    MovieActor.create(movie_id: params[:movie_id], actor_id: params[:actor_id])
    redirect_to "/movies/#{params[:movie_id]}"
  end
end