class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :show]
  before_action :move_to_index, only: [:index, :show]
  def index
    @products = Product.includes(:user).order("created_at DESC")
  end
  def new
    @Product = Product.new
  end
  def created
    Product.create(product_params)
  end
  def destroy
    prodcut = Product.find(params[:id])
    product.destory
  def edit
  end
  def update
    product = Product.find(params[:id])
    product.update
  end
  def show
  end
  private
  def product_params
    params.require(:product).permit(:name, :content, :category_id, :products_condition_id, :shipping_id, :delivery_fee_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end
  def set_product
    @product = Product.find(params[:id])
  end
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
