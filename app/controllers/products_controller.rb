class ProductsController < ApplicationController
 before_filter :authenticate_user!, except: [:index, :update, :show]

  def favorite
  	@product = Product.find(params[:id])
  	@favorite = @product.favorites.build(user: current_user)
    @fav_count = Favorite.count
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

  def create
  end

  def index
    @products = Product.search(params[:search])
  end

  def show
  	@product = Product.find(params[:id])
    @b_code = @product.bar_codes.first.barcode
    @ingredients = @product.ingredients
    @nutrition_facts = @product.nutritions
    @nutrit_amount = @product.product_nuts

    @dist = @product.distributers.first
    @distributer = Company.find(@dist.company_id)

    @manufact = @product.manufacturers.first
    @manufacturer = Company.find(@manufact.company_id)

    #@category = @product.categories.first.name
    c = Category.all
    c.each do |category|
      @category = category if category.id == @product.category_id
    end
  end

  def update
  	@product = Product.find(params[:id])
  	if @product.update_attributes(product_params)
  	  redirect_to product_path(@product)
  	end
  end

  private

  def product_params
    params.require(:product).permit(:description, :picture)
  end
end