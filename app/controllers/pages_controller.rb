class PagesController < ApplicationController

	def home
		render("home")
	end

	def account
		render("account")
	end
end
