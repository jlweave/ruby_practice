class Patient < ApplicationRecord
  has_many :doctor_patients
  has_many :doctors, through:  :doctor_patients
  
  def self.order_names
    # require 'pry'; binding.pry
   self.where("age >= 18").order(:name).pluck(:name)
  end
end