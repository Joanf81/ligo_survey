class ApplicationController < ActionController::Base
	protect_from_forgery with: :null_session

	rescue_from ActiveRecord::RecordNotFound, :with => :render_404

  	def render_404
    	render :plain => "Record not found.", :status => 404
  	end
end
