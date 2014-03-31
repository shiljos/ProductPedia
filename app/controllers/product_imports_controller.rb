class ProductImportsController < ApplicationController

  def new
    @product_import = ProductImport.new
  end

  def create
    @product_import = ProductImport.new(params[:product_import])
    if @product_import.save
      # @product_import = ProductImport.new(params[:product_import])
      # @results = @product_import.parse_spreadsheet
      redirect_to products_path
    else
      #render :new
      redirect_to root_path
    end
  end

  def import
  end
end