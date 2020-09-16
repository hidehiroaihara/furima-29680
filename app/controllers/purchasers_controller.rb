class PurchasersController < ApplicationController
  before_action ->{
      set_product
      move_to_user 
      move_to_index
  }
  def index
    @purchaser = PurchaserAddress.new
  end
  
  def create
    @purchaser = PurchaserAddress.new(purchaser_params)
     if @purchaser.valid?
        pay_item
        @purchaser.save
        return redirect_to root_path
     else
        render :index
     end
  end

  private

  def purchaser_params
     params.require(:purchaser_address).permit(:post_code, :city, :house_number, :phone_number, :prefecture_id, :purchaser_id, :building, :token).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def move_to_user
     unless user_signed_in?
       redirect_to user_session_path 
     end
  end
  
  def move_to_index
    if user_signed_in? && current_user.id == @product.user.id
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,
      card: params[:token],
      currency:'jpy'
    )
  end
end
