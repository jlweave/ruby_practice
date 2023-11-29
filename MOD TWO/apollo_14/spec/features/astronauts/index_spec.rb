
require 'rails_helper'

RSpec.describe 'Astronaut Show Page' do
  before (:each) do
    @astronaut1 = Astronaut.create!(name: "Buzz Lightyear", age: 32, job: "Cheap-slogans")
    @astronaut2 = Astronaut.create!(name: "Roger Chaffe", age: 31, job: "Comander")
    @astronaut3 = Astronaut.create!(name: "Virgil Grissom", age: 40, job: "First in Orbit")
    @astronaut4 = Astronaut.create!(name: "Edward White II", age: 36, job: "First in Moonwalk")

    @mission1 = Mission.create!(title: "Uncharted Plant", time_in_space: 81)
    @mission2 = Mission.create!(title: "Find Andy", time_in_space: 95)
    @mission3 = Mission.create!(title: "Date Jessie", time_in_space: 103)
    @mission4 = Mission.create!(title: "Apollo 1", time_in_space: 1)
    @mission5 = Mission.create!(title: "Gemini 3", time_in_space: 292)
    @mission6 = Mission.create!(title: "Mercury-Redstone 4", time_in_space: 15)
    @mission7 = Mission.create!(title: "Gemini 4", time_in_space: 5762)

    @astro_mis1 = AstronautMission.create!(astronaut_id: @astronaut1.id, mission_id: @mission1.id)
    @astro_mis2 = AstronautMission.create!(astronaut_id: @astronaut1.id, mission_id: @mission2.id)
    @astro_mis3 = AstronautMission.create!(astronaut_id: @astronaut1.id, mission_id: @mission3.id)
    @astro_mis4 = AstronautMission.create!(astronaut_id: @astronaut2.id, mission_id: @mission4.id)
    @astro_mis5 = AstronautMission.create!(astronaut_id: @astronaut3.id, mission_id: @mission4.id)
    @astro_mis6 = AstronautMission.create!(astronaut_id: @astronaut3.id, mission_id: @mission5.id)
    @astro_mis7 = AstronautMission.create!(astronaut_id: @astronaut3.id, mission_id: @mission6.id)
    @astro_mis8 = AstronautMission.create!(astronaut_id: @astronaut4.id, mission_id: @mission4.id)
    @astro_mis9 = AstronautMission.create!(astronaut_id: @astronaut4.id, mission_id: @mission7.id)
    
  end
  
  describe 'user story one' do
    it "list all the astronauts" do
      visit '/astronauts'
      
      expect(page).to have_content(@astronaut1.name)
      expect(page).to have_content(@astronaut1.age)
      expect(page).to have_content(@astronaut1.job)
      save_and_open_page
    end
  end

  describe 'user story three' do
    it "list the space missions' in alphabetical order for each astronaut" do
      visit '/astronauts'

      within("#astronaut_#{@astronaut1.id}") do 

        expect(@mission3.title).to appear_before(@mission2.title)
        expect(@mission2.title).to appear_before(@mission1.title)
      end
    end
  end


end
