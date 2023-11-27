require 'faraday'
require 'json'
class AdviceService 
    def self.random 
        response = conn.get('/advice')
        JSON.parse(response.body)
    end 

    def self.search(search_term)
        response = conn.get("/advice/search/#{search_term}")
        JSON.parse(response.body)
    end 

    def self.conn 
        Faraday.new("https://api.adviceslip.com")
    end 

end 