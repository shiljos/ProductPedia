class ProductStepsController < ApplicationController
	include Wicked::Wizard

	steps :nutrition_amount

	def show
    @product = Product.find(params[:p])
    @prod_nuts = @product.product_nuts
    render_wizard
	end

  def update
    ProductNut.update(params[:nutrients].keys, params[:nutrients].values)
    redirect_to product_path(:p)
  end
end
