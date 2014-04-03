class ProductStepsController < ApplicationController
	include Wicked::Wizard

	steps :ingredient_nutrition, :nutrition_amount , :manufact_distribute

	def show
    #@product = Product.find(params[:p])
    @product = Product.find(session[:new_product])
    @prod_nuts = @product.product_nuts
    render_wizard
	end

  def update
    @product = Product.find(session[:new_product])
    @prod_nut = @product.product_nuts
    @prod_ing = @product.product_ingredients
    case step
      when :ingredient_nutrition
        @ing_ids = params[:product][:ingredient_tokens].split(",")
        @nut_ids = params[:product][:nutrition_tokens].split(",")
        if @ing_ids.blank? || @nut_ids.blank?
          render_step(:ingredient_nutrition)
        else
          @ing_ids.each do |ing|
            @product.product_ingredients.build(ingredient_id: ing)
          end
          @nut_ids.each do |nut|
            @product.product_nuts.build(nutrition_id: nut)
          end
          render_wizard @product
        end
      when :nutrition_amount
        params[:nutrients].values.each do |n|
          if n[:amount].blank?
            #render_step[:nutrition_amount] 
            redirect_to :back and return 
          end
        end
          @nut_amounts = ProductNut.update(params[:nutrients].keys, params[:nutrients].values)
          redirect_to wizard_path(:manufact_distribute)
          #render_step(:nutrition_amount)
          # @nut_amounts.reject! {|p| p.errors.empty?}
          # if @nut_amounts.empty?
          #   redirect_to wizard_path(:manufact_distribute)
          # else
          #   render_step(:nutrition_amount)
          # end  
      when :manufact_distribute
        if params[:product][:distribution_company_tokens].blank?
           render_step(:manufact_distribute)
        else
          @product.distribution_companies.build(company_id: params[:product][:distribution_company_tokens]) 
          @product.manufacture_companies.build(company_id: params[:product][:manufacture_company_tokens])
        end
      end
  end

private

  def redirect_to_finish_wizard
    redirect_to product_path(session[:new_product]), notice: "Thank you for creating the product"
  end
end