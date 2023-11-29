require 'spec_helper'


RSpec.describe Auction do
  before (:each) do
    @auction = Auction.new
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')
    @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
  end

  describe '#initialize' do
    it 'exists and has readable attributes' do

      expect(@auction).to be_an_instance_of(Auction)
      expect(@auction.items).to eq([])
    end
  end

  describe '#add_item' do
    it 'can add items to the auction in an array' do
      # @item1 = Item.new('Chalkware Piggy Bank')
      # @item2 = Item.new('Bamboo Picture Frame')
      @auction.add_item(@item1)
      @auction.add_item(@item2)

      expect(@auction.items).to eq([@item1, @item2])
    end
  end

  describe '#item_names' do
    it 'can list the items names in an array' do
      # @item1 = Item.new('Chalkware Piggy Bank')
      # @item2 = Item.new('Bamboo Picture Frame')
      @auction.add_item(@item1)
      @auction.add_item(@item2)

      expect(@auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
    end
  end

  describe '#add_bid' do
    it 'can and bids to an item by specific attendee and price' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)

      expect(@item1.bids).to eq({})
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      expect(@item1.add_bid(@attendee2, 20)).to eq({ @attendee2 => 20,
                                                    @attendee1 => 22
                                                  })
    end
  end

  xdescribe '#current_high_bid/IT2' do
    it "can take the bids and pick the highest one" do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)

      expect(@item1.current_high_bid).to eq(22)
    end
  end

  xdescribe '#unpopular_items' do
    it 'can return the items that have not been bid one' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)

      expect(@auction.unpopular_items).to eq([@item2, @item5])
    end
  end

  xdescribe '#potential_revenue' do
    it 'can add up the amount that has been bid' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)

      expect(@auction.potential_revenue).to eq(87)
    end
  end

  xdescribe '#bidders/IT3' do
    it 'can list the attendees in an array' do

    end
  end

  xdescribe '#closing_bidding' do
    it 'update the item so that it will not accept additional bids' do

    end
  end

  xdescribe '#bidder_info' do
    it 'return a hash with keys that are attendees, and values that are a hash with that attendee
     budget and an array of items that attendee has bid on' do
    end
  end
end
