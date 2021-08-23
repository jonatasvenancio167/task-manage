require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  let!(:user) { create(:user) }
  let(:user_id) { user.id }

  before { host! "localhost:3000" }

  describe "GET /users/:id" do
    before do
      headers = { "Accept" => "application/localhost:3000/v1" }
      get "/users/#{user_id}", params: {}, headers: headers
    end

    context "when the user exist" do
      it "returns the user" do
        user_response = JSON.parse(response.body)
        expect(user_response["id"]).to eq(user_id) 
      end

      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end
    end

    context "when the user does not exist" do
      let(:user_id) { 1000 }
      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end
    end
  end

  # describe "GET /index" do
  #   pending "add some examples (or delete) #{__FILE__}"
  # end
end
