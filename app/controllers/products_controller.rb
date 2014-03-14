class ProductsController < ApplicationController
 before_filter :authenticate_user!, except: [:index, :update, :show]

  def favorite
  	@product = Product.find(params[:id])
  	@favorite = @product.favorites.build(user: current_user)
  	@favorite.save
  	redirect_to @product
  end

  def remove_favorite
    @product = Product.find(params[:id])
    @rm_favorite = Favorite.where(user_id: current_user.id, product_id: @product.id)
    if !@rm_favorite.empty?
      Favorite.delete(@rm_favorite.first.id)
    end
    redirect_to @product
  end

  def index
  	#@products = Product.all
    @products = Product.search(params[:search])
    # if params[:search]
    #   @products = Product.all(conditions: ['name LIKE ?', "%#{params[:search]}%"])
    # else
    #   @products = Product.all
    # end
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