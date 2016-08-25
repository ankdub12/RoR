class UserController < ApplicationController
	before_action :require_login, except: [:new, :create]
	before_action :require_correct_user, only: [:show, :edit, :update, :delete]

	
	def show
	 @user = User.find(params[:id])
	 @secret = @user.secrets   #to display secret of particular userid, and query will be User.first.secrets
	 # @secrets_likes = @user.secrets_likes
	end

	def logout
		session[:user_id] = nil
		redirect_to '/sessions/new'
	end

	def new
	end

	def create
		@user = User.create(user_params)
		# last_user = User.last
		if @user.valid?
			session[:user_id] = @user.id
			redirect_to "/user/#{@user.id}"
		else

			flash[:errors] = @user.errors.full_messages
			redirect_to :back
		end
	end

	def edit
		@user = User.find(params[:id])
		
	end

	def update
		@user = User.find(params[:id])
		@user.update_attributes(id: params[:id], name: params[:name], email: params[:email])
		redirect_to "/user/#{@user.id}"
	end

	def delete
		@user = User.destroy(params[:id])
		session[:user_id] = nil
		redirect_to "/sessions/new"
		
	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
		
	end

end
