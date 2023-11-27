require "rails_helper"

RSpec.describe "Movie Show Page" do
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

    @actor_1 = Actor.create!(name: "Willy Wonka", age: 45)
    @actor_2 = Actor.create!(name: "Charlie", age: 12)
    @actor_3 = Actor.create!(name: "Grandpa", age: 89)
    @actor_4 = Actor.create!(name: "August", age: 13)
    @actor_5 = Actor.create!(name: "Veronica", age: 10)
    @actor_6 = Actor.create!(name: "Andy Warhol", age: 32)
    @actor_7 = Actor.create!(name: "Jackie O", age: 35)
    @actor_8 = Actor.create!(name: "Marylin Monroe", age: 31)
    @actor_9 = Actor.create!(name: "Billy Box", age: 24)
    @actor_10 = Actor.create!(name: "Suzzy Q", age: 17)
    @actor_11 = Actor.create!(name: "Jimmy Dean", age: 35)
    @actor_12 = Actor.create!(name: "Chuck Uperton", age: 22)
    @actor_13 = Actor.create!(name: "Lucy Lou", age: 57)

    @movie_actors_1 = MovieActor.create(movie: @movie_1, actor: @actor_1)
    @movie_actors_2 = MovieActor.create(movie: @movie_1, actor: @actor_2)
    @movie_actors_3 = MovieActor.create(movie: @movie_1, actor: @actor_3)
    @movie_actors_4 = MovieActor.create(movie: @movie_2, actor: @actor_4)
    @movie_actors_5 = MovieActor.create(movie: @movie_2, actor: @actor_5)
    @movie_actors_6 = MovieActor.create(movie: @movie_2, actor: @actor_2)
    @movie_actors_7 = MovieActor.create(movie: @movie_3, actor: @actor_5)
    @movie_actors_8 = MovieActor.create(movie: @movie_4, actor: @actor_6)
    @movie_actors_9 = MovieActor.create(movie: @movie_4, actor: @actor_7)
    @movie_actors_10 = MovieActor.create(movie: @movie_4, actor: @actor_8)
    @movie_actors_11 = MovieActor.create(movie: @movie_5, actor: @actor_9)
    @movie_actors_12 = MovieActor.create(movie: @movie_5, actor: @actor_6)
    @movie_actors_13 = MovieActor.create(movie: @movie_6, actor: @actor_7)
    @movie_actors_14 = MovieActor.create(movie: @movie_6, actor: @actor_8)
    @movie_actors_15 = MovieActor.create(movie: @movie_7, actor: @actor_7)
    @movie_actors_16 = MovieActor.create(movie: @movie_8, actor: @actor_10)
    @movie_actors_17 = MovieActor.create(movie: @movie_8, actor: @actor_11)
    @movie_actors_18 = MovieActor.create(movie: @movie_9, actor: @actor_12)
    @movie_actors_19 = MovieActor.create(movie: @movie_9, actor: @actor_13)
    @movie_actors_20 = MovieActor.create(movie: @movie_9, actor: @actor_12)
  end

  describe "user story 2" do
    describe "when I visit a movie's show page" do
      it "show the attributes for that movie" do
        visit "/movies/#{@movie_2.id}"
       
        expect(page).to have_content(@movie_2.title)
        expect(page).to have_content(@movie_2.creation_year)
        expect(page).to have_content(@movie_2.genre)

        expect(page).to_not have_content(@movie_3.title)
        expect(page).to_not have_content(@movie_4.title)
        expect(page).to_not have_content(@movie_9.title)
      end

      xit "lists all of its actors from youngest to oldest" do
        visit "/movies/#{@movie_2.id}"
          # require 'pry'; binding.pry
        expect(@actor_5).to appear_before(@actor_2)
        expect(@actor_2).to appear_before(@actor_4)
      end

      it "shows the average age of the actors" do
        visit "/movies/#{@movie_2.id}"

        expect(page).to have_content(@movie_2.avg_age)

        expect(page).to_not have_content(@movie_7.avg_age)
        expect(page).to_not have_content(@movie_9.avg_age)
        save_and_open_page
      end
    end
  end

  describe "user story 3" do
    describe "when I visit a movie show page" do
      describe " I do not see actors not apart of that movie" do
        it "shows a form with the ID of an actor that exists in the database" do
          visit "/movies/#{@movie_2}"

          expect(page).to have_field("Actor ID")
          fill_in("Actor ID", with: @actor_1.id)
          click_button("Submit")
          expect(current_path).to eq("/movies/#{@movie_2.id}")
        end
      end
    end
  end
end
