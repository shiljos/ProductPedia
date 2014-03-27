class ProductStepsController < ApplicationController
	include Wicked::Wizard

	steps :nutrition_amount

	def show
    @product = Product.find(params[:p])
    @prod_nuts = @product.product_nuts
    session[:new_product]=params[:p]
    render_wizard 
	end

  def update
    ProductNut.update(params[:nutrients].keys, params[:nutrients].values)
    redirect_to_finish_wizard
  end


  def finish_wizard_path
    product_path(session[:new_product])
  end
end