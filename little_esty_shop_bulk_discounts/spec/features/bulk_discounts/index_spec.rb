require "rails_helper" 

RSpec.describe "Merchant Bulk Discounts Index" do
  before (:each) do
    
    @m1 = Merchant.create!(name: 'Merchant 1')
    @m2 = Merchant.create!(name: 'Merchant 2')
    @m3 = Merchant.create!(name: 'Merchant 3', status: 1)
    @m4 = Merchant.create!(name: 'Merchant 4')
    @m5 = Merchant.create!(name: 'Merchant 5')
    @m6 = Merchant.create!(name: 'Merchant 6')
    
    @bd1 = BulkDiscount.create!(name: "Discount A", percentage: 25, threshold: 20, merchant_id: @m1.id)
    @bd2 = BulkDiscount.create!(name: "Discount B", percentage: 10, threshold: 5, merchant_id: @m1.id)
    @bd3 = BulkDiscount.create!(name: "Discount C", percentage: 20, threshold: 15, merchant_id: @m1.id)
    @bd4 = BulkDiscount.create!(name: "Discount D", percentage: 15, threshold: 10, merchant_id: @m2.id)
    @bd5 = BulkDiscount.create!(name: "Discount E", percentage: 30, threshold: 20, merchant_id: @m4.id)
    @bd6 = BulkDiscount.create!(name: "Discount F", percentage: 35, threshold: 25, merchant_id: @m4.id)

    @c1 = Customer.create!(first_name: 'Yo', last_name: 'Yoz')
    @c2 = Customer.create!(first_name: 'Hey', last_name: 'Heyz')

    @i1 = Invoice.create!(customer_id: @c1.id, status: 2)
    @i2 = Invoice.create!(customer_id: @c1.id, status: 2)
    @i3 = Invoice.create!(customer_id: @c2.id, status: 2)
    @i4 = Invoice.create!(customer_id: @c2.id, status: 2)
    @i5 = Invoice.create!(customer_id: @c2.id, status: 2)
    @i6 = Invoice.create!(customer_id: @c2.id, status: 2)
    @i7 = Invoice.create!(customer_id: @c1.id, status: 2)
    @i8 = Invoice.create!(customer_id: @c1.id, status: 2)
    @i9 = Invoice.create!(customer_id: @c1.id, status: 2)
    @i10 = Invoice.create!(customer_id: @c2.id, status: 2)
    @i11 = Invoice.create!(customer_id: @c2.id, status: 2)
    @i12 = Invoice.create!(customer_id: @c2.id, status: 2)

    @item_1 = Item.create!(name: 'Shampoo', description: 'This washes your hair', unit_price: 10, merchant_id: @m1.id)
    @item_2 = Item.create!(name: 'Conditioner', description: 'This makes your hair shiny', unit_price: 8, merchant_id: @m2.id)
    @item_3 = Item.create!(name: 'Brush', description: 'This takes out tangles', unit_price: 5, merchant_id: @m3.id)
    @item_4 = Item.create!(name: 'test', description: 'lalala', unit_price: 6, merchant_id: @m4.id)
    @item_5 = Item.create!(name: 'rest', description: 'dont test me', unit_price: 12, merchant_id: @m5.id)

    @ii_1 = InvoiceItem.create!(invoice_id: @i1.id, item_id: @item_1.id, quantity: 12, unit_price: 10, status: 0)
    @ii_2 = InvoiceItem.create!(invoice_id: @i2.id, item_id: @item_2.id, quantity: 6, unit_price: 8, status: 1)
    @ii_3 = InvoiceItem.create!(invoice_id: @i3.id, item_id: @item_3.id, quantity: 16, unit_price: 5, status: 2)
    @ii_4 = InvoiceItem.create!(invoice_id: @i4.id, item_id: @item_3.id, quantity: 2, unit_price: 5, status: 2)
    @ii_5 = InvoiceItem.create!(invoice_id: @i5.id, item_id: @item_3.id, quantity: 10, unit_price: 5, status: 2)
    @ii_6 = InvoiceItem.create!(invoice_id: @i1.id, item_id: @item_3.id, quantity: 7, unit_price: 5, status: 2)
    @ii_7 = InvoiceItem.create!(invoice_id: @i2.id, item_id: @item_3.id, quantity: 1, unit_price: 5, status: 2)

    @t1 = Transaction.create!(credit_card_number: 203942, result: 1, invoice_id: @i1.id)
    @t2 = Transaction.create!(credit_card_number: 230948, result: 1, invoice_id: @i2.id)
    @t3 = Transaction.create!(credit_card_number: 234092, result: 1, invoice_id: @i3.id)
    @t4 = Transaction.create!(credit_card_number: 230429, result: 1, invoice_id: @i5.id)
    @t5 = Transaction.create!(credit_card_number: 102938, result: 1, invoice_id: @i6.id)
    @t6 = Transaction.create!(credit_card_number: 102938, result: 1, invoice_id: @i1.id)

    visit merchant_bulk_discounts_path(@m1.id)
  end
  describe "User Story 1" do
    describe "After starting on the merchant dashboard, I have see a link to see all BD" do
      it "when I click this link, I am taken to the BD index page where I see all including percentage and threshold" do
       within "#bd_index#{@bd1.id}" do
          expect(page).to have_content(@bd1.name)
          expect(page).to have_content(@bd1.percentage)
          expect(page).to have_content(@bd1.threshold)
        end
      end

      it "has a like to that bulk discounts show page" do
        within "#bd_index#{@bd1.id}" do
          expect(page).to have_link("#{@bd1.name} Show Page")
        end
      end
    end
  end

  describe "User Story 2" do
    describe "when I visit bulk discount index page" do
      it "has a link to create a new discount" do
        
        expect(page).to have_link("Create New Discount")
      end

      it "when I click this link I am taken to a new page where I see a form to add new" do

        expect(page).to have_link("Create New Discount")
        click_link("Create New Discount")
        expect(current_path).to eq(new_merchant_bulk_discount_path(@m1, @db1))
      end
    end
  end

  describe "User Story 3" do
    describe "When I visist the bulk discount index page" do
      it "has a link to delete a bulk discount" do
        within "#bd_index#{@bd1.id}" do
          expect(page).to have_link("Delete #{@bd1.name}")
        end
      end

      it "will delete discount after and return to index page" do

        within "#bd_index#{@bd1.id}" do
          click_link("Delete #{@bd1.name}")
          expect(current_path).to eq(merchant_bulk_discounts_path(@m1.id))
        end

        expect(page).to_not have_content("Delete #{@bd1.name}")
      end
    end
  end
end

# <%= require 'pry'; binding.pry %>