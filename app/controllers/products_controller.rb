class ProductsController < ApplicationController
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
    @product = Product.find(params[:id])
  end
  def update
    product = Product.find(params[:id])
    product.update
  private
  def product_params
    params.require(:product).permit(:name, :content, :category_id, :products_condition_id, :shipping_id, :delivery_fee_id, :delivery_day_id, :price, :user_id)
  end

end
