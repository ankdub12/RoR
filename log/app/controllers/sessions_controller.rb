class SessionsController < ApplicationController
	
	def new
		
	end

	def login
		@user = User.find_by_email(params[:Email])
		if @user && @user.authenticate(params[:Password])
			session[:user_id] = @user.id
			redirect_to "/user/#{@user.id}"
		else
			flash[:errors] = ["Invalid"]
			redirect_to "/user/new"
		end
	end



	

end
