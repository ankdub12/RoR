class SecretsController < ApplicationController


def index
	@secret = Secret.all
	@likes = Like.count
end
def create
	@user = User.find(params[:id])
	Secret.create(content: params[:content], user_id: params[:id])
	redirect_to :back
end
def destroy
	secret = Secret.destroy(params[:id])
	secret.destroy if secret.user == current_user
	redirect_to :back
end

end
