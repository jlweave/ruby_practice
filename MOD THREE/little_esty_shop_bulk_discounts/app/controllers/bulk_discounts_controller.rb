class BulkDiscountsController < ApplicationController

  def index
    @merchant = Merchant.find(params[:merchant_id])
    
    response = HTTParty.get('https://date.nager.at/api/v3/PublicHolidays/2023/US')
    api_body = response.body
    # require 'pry'; binding.pry
    @holidays = JSON.parse(api_body, symbolize_names: true).first(3)
  end

  def show
    @merchant = Merchant.find(params[:merchant_id])
    @bd = BulkDiscount.find(params[:id])
  end

  def new
    @merchant = Merchant.find(params[:merchant_id])
  end

  def create
    m = Merchant.find(params[:merchant_id])
    bd = m.bulk_discounts.create!(strong_params)
    redirect_to merchant_bulk_discounts_path(m.id)
  end

  def destroy
    m = Merchant.find(params[:merchant_id])
    bd = BulkDiscount.find(params[:id])
    bd.destroy
    redirect_to merchant_bulk_discounts_path(m.id)
  end

  def edit
    @merchant = Merchant.find(params[:merchant_id])
    @bd = BulkDiscount.find(params[:id])
  end

  def update
    m = Merchant.find(params[:merchant_id])
    bd = BulkDiscount.find(params[:id])
    bd.update(nested_params)
    #nested params X(
    redirect_to merchant_bulk_discount_path(m.id)
  end


  private

  def strong_params
    params.permit(:name, :percentage, :threshold)
  end

  def nested_params
    #:bulk_discount from pry session
    params.require(:bulk_discount).permit(:name, :percentage, :threshold)
  end
end