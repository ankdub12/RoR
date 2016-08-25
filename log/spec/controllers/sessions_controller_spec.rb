require 'rails_helper'
RSpec.describe SecretsController, type: :controller do
  # ...
  describe "when logged in as the wrong user" do
    before do
      @wrong_user = create_user 'julius', 'julius@lakers.com'
      session[:user_id] = @wrong_user.id
      @secret = @user.secrets.create(content: 'Ooops')
    end
    it "cannot access destroy" do
      delete :destroy, id: @secret, user_id: @user
      expect(response).to redirect_to("/users/#{@wrong_user.id}")
    end
  end
end
