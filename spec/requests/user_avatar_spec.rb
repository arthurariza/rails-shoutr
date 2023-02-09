require 'rails_helper'

RSpec.describe "UserAvatars", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/user_avatar/create"
      expect(response).to have_http_status(:success)
    end
  end

end
