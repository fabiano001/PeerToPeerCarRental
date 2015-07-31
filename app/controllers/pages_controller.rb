class PagesController < ApplicationController

	def home
		render("home")
	end

	def account
		render("account")
	end

	def search
		render("search")
	end

	def redirect
		session[:login_redirect] = params[:type]
		render :json => { :message => "redirect saved" }
	end
end
