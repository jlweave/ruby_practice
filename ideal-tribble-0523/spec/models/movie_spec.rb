require 'rails_helper'

RSpec.describe Movie do
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

  describe 'relationships' do
    it {should belong_to :studio}
    it {should have_many :movie_actors}
    it {should have_many(:actors).through(:movie_actors)}
  end

  describe "model methods" do
    xdescribe "avg_age" do
      it "shows the average age of actor for a specific movie" do
        # require 'pry'; binding.pry
        expect(@movie_2.avg_age).to eq(11.17)
        expect(@movie_3.avg_age).to eq(22.5)

        expect(@movie_3.avg_age).to_not eq(11.17)
      end
    end

    xdescribe "name_sort" do
      it "orders the actors name youngest to oldest" do
        expect(@movie_2.name_sort).to eq("Actors for movie (youngest to oldest): Veronica, Charlie, August,")
      end
    end
  end
end
