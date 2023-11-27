require './lib/library'
require './lib/author'

RSpec.describe Library do
  before(:each) do
    @dpl = Library.new("Denver Public Library")
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    @harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
  end

  describe '#initialize' do
    it 'exists and has readable attributes' do
      expect(@dpl).to be_an_instance_of Library
      expect(@dpl.name).to eq("Denver Public Library"
)
      expect(@dpl.books).to eq([])
      expect(@dpl.authors).to eq([])
    end
  end
end
