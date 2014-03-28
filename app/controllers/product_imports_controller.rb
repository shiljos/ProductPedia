class ProductImportsController < ApplicationController

  def new
    @product_import = ProductImport.new
  end

  def create
    if params[:product_import].ni?

    else
      @product_import = ProductImport.new(params[:product_import])
      @results = @product_import.parse_spreadsheet
    end
  end

  def import
  end
end