class PurchasersController < ApplicationController

  def index
  end

  def create
    @purchaser = PurchaserAddress.new(purchaser_params)
    @purchaser.save
  end

  private

  def purchaser_params
    params.require(:purchaser_address).permit(:post_code, :city, :house_number, :building, :phone_number)
end
