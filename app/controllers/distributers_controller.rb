class DistributersController < ApplicationController
	def index
	  @distributers = Company.where("LOWER(name) like ?", "%#{params[:q]}%")
  	respond_to do |format|
    format.html
    format.json { render :json => @distributers }
    end
	end
end