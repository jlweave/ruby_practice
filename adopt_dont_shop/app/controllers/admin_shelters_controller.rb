class AdminSheltersController < ApplicationController
  def index
    @shelters = Shelter.order_desc
    @shelters_pending = Shelter.pending
  end
end