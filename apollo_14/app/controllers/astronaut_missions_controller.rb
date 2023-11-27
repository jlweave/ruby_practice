class AstronautMissionsController < ApplicationController
  def create
    @astronaut = Astronaut.find(params[:id])
    @astronaut_mission = AstronautMission.create(astronaut_id: @astronaut, mission_id: astronaut_mission_params(:mission_id))
  end
end

private
def astronaut_mission_params
  params.permit(:mission_id, :id)
  
end