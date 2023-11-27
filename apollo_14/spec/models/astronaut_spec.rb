require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  it 'returns averager Astronaut age' do
    @astronaut1 = Astronaut.create!(name: "Buzz Lightyear", age: 32, job: "Cheap-slogans")
    @astronaut2 = Astronaut.create!(name: "Roger Chaffe", age: 31, job: "Comander")
    @astronaut3 = Astronaut.create!(name: "Virgil Grissom", age: 40, job: "First in Orbit")
    @astronaut4 = Astronaut.create!(name: "Edward White II", age: 36, job: "First in Moonwalk")

    expect(Astronaut.average_age).to eq(34.75)
  end

  describe "user story four" do
  it 'list how long each astronaut was in space' do
    visit '/astronaut'

    expect(page).to have_content(279)
    expect(page).to have_content(1)
    expect(page).to have_content(278)
    expect(page).to have_content(5763)
  end
end
end
