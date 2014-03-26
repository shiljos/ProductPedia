class IngredientsController < ApplicationController
 	def index
    @ingredients = Ingredient.where("LOWER(name) like ?", "%#{params[:q]}%")
    respond_to do |format|
      format.html
      format.json { render :json => @ingredients }
    end
  end
end