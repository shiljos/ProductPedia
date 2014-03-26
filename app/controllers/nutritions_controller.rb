class NutritionsController < ApplicationController
	def index
    @nutritions = Nutrition.where("LOWER(name) like ?", "%#{params[:q]}%")
    respond_to do |format|
    format.html
    format.json { render :json => @nutritions }
    end
  end
end