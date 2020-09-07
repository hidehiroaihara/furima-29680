class ProductsController < ApplicationController
  def index
    @products = Product.includes(:user).order("created_at DESC")
  end
  def new
    @Product = Product.new
  end
  
end
