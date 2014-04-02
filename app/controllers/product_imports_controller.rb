class ProductImportsController < ApplicationController

  def new
    @product_import = ProductImport.new
  end

  def create
    if params[:product_import].nil?
      #@product_import = ProductImport.new
      redirect_to new_product_path and return
    else
      @product_import = ProductImport.new(params[:product_import])
    end
    if @product_import.save
      # @product_import = ProductImport.new(params[:product_import])
      # @results = @product_import.parse_spreadsheet
      redirect_to products_path
    else
      redirect_to root_path
    end
  end

  def import
  end
end