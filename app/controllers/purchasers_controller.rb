class PurchasersController < ApplicationController
  before_action ->{
      set_product
      move_to_user 
      move_to_index
  }
  def index
    @purchaser = Purchaser.includes(:product, :user)
  end

  def create
    binding.pry
    @purchaser = PurchaserAddress.new(purchaser_params)
     if @purchaser.valid?
        @purchaser.save
        return redirect_to root_path
     else
        render :index
     end
  end

  private

  def purchaser_params
     params.require(:purchaser_address).permit(:post_code, :city, :house_number, :building, :phone_number).merge(purchaser_id: purchaser.id, uesr_id: current_user.id, product_id: params[:product_id])
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
end
