class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movie_actors
  has_many :actors, through: :movie_actors

  def avg_age
    self.actors.average(:age).round(2)
    # require 'pry'; binding.pry
  end

  def name_sort
    self.actors.order(:age)
  end
end
