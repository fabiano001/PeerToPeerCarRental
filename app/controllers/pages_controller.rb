class PagesController < ApplicationController

	def home
		@cars = Car.all.includes(:pictures).order(id: :asc)
		render("home")
	end

	def account
		render("account")
	end

	def search
	end

	def search_results_api
		cars = Car.includes(:pictures).order(id: :asc)

		session[:back_click] = nil;
	    
	    if cars.nil?
	        info = { :error => 'Unable to load cars' }
	        render(:status => 404, :json => info)
	    else
	      render(:status => 201, :json => cars.to_json({:include => :pictures}))
	    end
	end

	def cache_search_results_api

		@cache = Cache.new(:search_results => params[:user_search_html], :user_id => current_user.id)

	    if(@cache.save)
	      logger.info("users search results saved")
	      render :json => { :status => 201, :json => "users search results saved" }
	    else
	     render :json => { :status => 404, :json => "users search results save failed" }
	    end

		session[:back_click] = "true";
	end

	def rent_confirmation
	    render("confirmation")
	  end

	def redirect
		session[:login_redirect] = params[:type]
		session[:car_id] = params[:car_id]
		render :json => { :message => "redirect saved" }
	end
end
