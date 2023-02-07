require 'rails_helper'

RSpec.describe "Shouts", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/shout/index"
      expect(response).to have_http_status(:success)
    end
  end

end
