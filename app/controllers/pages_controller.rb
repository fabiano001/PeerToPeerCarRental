class PagesController < ApplicationController

	def home
		@cars = Car.all
		@pictures = @cars.map do |car|
			Picture.where("car_id = ?", car).first
		end
		
		render("home")
	end

	def account
		render("account")
	end

	def search
		render("search")
	end

	def rent_confirmation
	    render("confirmation")
	  end

	def redirect
		session[:login_redirect] = params[:type]
		render :json => { :message => "redirect saved" }
	end
end
