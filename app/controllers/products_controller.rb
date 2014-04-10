require 'will_paginate/array'

class ProductsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show, :autocomplete]

  def autocomplete
    # render json: [{"value" => "Product 1"}, {"value" => "Mercedes 1"}, {"value" => "Volvo 1" }]
    render json: Product.search(params[:search], fields: [{name: :text_start}], limit: 10).map { |p| { "value" => p.name } }
  end

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

  def new
    @new_product = Product.new
    @product_import = ProductImport.new
    barcode = @new_product.bar_codes.build
    distributer = @new_product.distribution_companies
    manufacturer = @new_product.manufacture_companies
  end

  def create
    @new_product = Product.new(product_params)
    if @new_product.save
      session[:new_product] = @new_product.id
      redirect_to product_steps_path
      #redirect_to products_path(:p => @new_product.id)
    else
      @product_import = ProductImport.new
      render 'new'
    end
  end

  def index
    # @products = Product.search(params[:search])
    # @products = @products.page(params[:page]).per_page(10)
    if params[:search].present?
      @products = Product.search(params[:search], page: params[:page], per_page: 20)
    else
      @products = Product.all.page(params[:page]).per_page(20)
    end
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

    c = Category.all
    c.each do |category|
      @category = category if category.id == @product.category_id
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
  	@product = Product.find(params[:id])
  	if @product.update_attributes(product_params)
  	  redirect_to product_path(@product)
    else
     render :edit
  	end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :picture, :warning, :ingredient_tokens, :nutrition_tokens, :distribution_company_tokens, :manufacture_company_tokens, :category_id, :bar_codes_attributes => [:barcode])
  end
end