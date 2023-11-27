require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do
  before(:each) do
    @vendor = Vendor.new("Rocky Mountain Fresh")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
  end

  describe '#initialize' do
    it 'exissts and has readable attributes' do
      expect(@vendor).to be_an_instance_of(Vendor)
      expect(@vendor.name).to eq("Rocky Mountain Fresh")
      expect(@vendor.inventory).to eq({})
    end
  end

  describe '#check_stock'
    it 'can check the instock of an item and update it' do
      expect(@vendor.check_stock(@item1)).to eq(0)
      @vendor.stock(@item1, 30)
      # expect(@vendor.inventory).to eq(@item1)
      expect(@vendor.check_stock(@item1)).to eq(30)
    end
end
