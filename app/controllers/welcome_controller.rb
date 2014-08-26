class WelcomeController < ApplicationController

	def index
		If user_signed_in?
			redirect_to :controller => ‘todo’, :action => ‘index’
		end
	end
end
