require "rails_helper"

RSpec.describe "Studio Index Page" do
  before (:each) do
    @studio_1 = Studio.create!(name: "Willy Wonka", location: "Chocolate Factory")
    @studio_2 = Studio.create!(name: "Andy Warhol", location: "The Factory")
    @studio_3 = Studio.create!(name: "Jack the Clipper", location: "The Director's Cut")
    @studio_4 = Studio.create!(name: "Let's do it Tomorrow", location: "Slackers Inc.")

    @movie_1 = @studio_1.movies.create!(title: "Gob-Stoppers", creation_year: "1964", genre: "Horror")
    @movie_2 = @studio_1.movies.create!(title: "Cinnamon Farts", creation_year: "1971", genre: "Crime film")
    @movie_3 = @studio_1.movies.create!(title: "Whizzdoodles", creation_year: "1972", genre: "Adventure")
    @movie_4 = @studio_2.movies.create!(title: "Campbell's Soup", creation_year: "1972", genre: "Comedy")
    @movie_5 = @studio_2.movies.create!(title: "Brillo Box", creation_year: "1964", genre: "Drama")
    @movie_6 = @studio_2.movies.create!(title: "Marilyn Diptych", creation_year: "1961", genre: "Adventure")
    @movie_7 = @studio_2.movies.create!(title: "Red Jackie", creation_year: "1964", genre: "Western")
    @movie_8 = @studio_3.movies.create!(title: "Hairspray", creation_year: "1964", genre: "Romance")
    @movie_9 = @studio_3.movies.create!(title: "Grease", creation_year: "1964", genre: "Horror")
  end

  describe "user story 1" do
    describe "When I visit the studio index page" do
      it "shows all studios with name and location" do
        visit "/studios"
        #add div tag at end#
        expect(page).to have_content(@studio_1.name)
        expect(page).to have_content(@studio_1.location)
# save_and_open_page
        # expect(page).to_not have_content(@movie_1.title)
        # expect(page).to_not have_content(@movie_5.title)
      end

      it "shows all the movies and their attributes under each studio" do
        visit "/studios"
        #add div tag at the end#
        expect(page).to have_content(@studio_1.name)
        expect(page).to have_content(@studio_1.location)
        expect(page).to have_content(@movie_1.title)
        # expect(page).to_not have_content(@movie_7.title)
      end
    end
  end

end