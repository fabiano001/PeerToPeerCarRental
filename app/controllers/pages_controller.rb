class PagesController < ApplicationController
	
	def home
		render("home")
	end

	def login
		render("login")
	end
end
