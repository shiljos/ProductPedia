class ProductsController < ApplicationController
  skip_before_filter :authenticate_user!, only: :index

  def index
  	@products = Product.all
  end

  def show
  	@product = Product.find(params[:id])
  end
end