class SearchController < ApplicationController
  def index
    @nation_search = params[:nation]
    # require 'pry'; binding.pry

   conn =  Faraday.new(url:'https://last-airbender-api.fly.dev')
   response = conn.get('/api/v1/characters?affiliation=FIRE+NATION') #do |req|
    # req.params[] = term
    
   ### this isn't right it is only going to give fire nation information###
  #  response = conn.get('/api/v1/characters?affiliation=NATION+NAME')
  require 'pry'; binding.pry
   data = JSON.parse(response.body, symbolize_names: true)
   nation_list = data.first(25)
   @nations = [nation_list]

  end

end