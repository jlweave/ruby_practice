class Mission < ApplicationRecord
  has_many :astronaut_missions
  has_many :astronauts, through: :astronaut_missions
  validates_presence_of :title, :time_in_space


  def self.spacy_time_total
    sum(:time_in_space)
  end
end
