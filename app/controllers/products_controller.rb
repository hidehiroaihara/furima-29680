class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show]
  
  def index
    @products = Product.includes(:user).order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else 
      render :new
    end
  end

  def destroy
     if  @product.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product.id)
    else
      redirect_to edit_product_path(@product.id)
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :content, :category_id, :products_condition_id, :shipping_id, :delivery_fee_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end
   def set_product
     @product = Product.find(params[:id])
   end
  def move_to_index
      redirect_to action: :index unless user_signed_in?
  end
end
