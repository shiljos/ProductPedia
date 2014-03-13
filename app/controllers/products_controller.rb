class ProductsController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:index, :show, :update]

  def favorite
  	@product = Product.find(params[:id])
  	@favorite = @product.favorites.build(user: current_user)
  	#@favorite.save
  	redirect_to @product
  end

  def index
  	@products = Product.all
  end

  def show
  	@product = Product.find(params[:id])
  end

  def update
  	@product = Product.find(params[:id])
  	if @product.update_attributes(product_params)
  	  redirect_to product_path(@product)
  	end
  end

  private

  def product_params
    params.require(:product).permit(:description)
  end
end