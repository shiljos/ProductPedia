class ManufacturersController < ApplicationController
	def index
	  @manufacturer = Company.where("LOWER(name) like ?", "%#{params[:q]}%")
  	respond_to do |format|
      format.html
      format.json { render :json => @manufacturer }
    end
	end
end