require "rails_helper"

RSpec.describe MatrixsController, :type => :controller do

  before(:context) do
   @valid_matrix =  [
           [1, 0, 1, 1],
           [0, 1, 0, 1],
           [1, 1, 1, 0],
           [1, 1, 1, 1]
          ]

    @invalid_matrix = [
           [1, 0, 1, 1],
           [0, 2, 0, 1],
           [1, 4, 1, 0],
           [1, 1, 3, 1]
          ]
  end 

  context "GET #sub_matrix" do
    it "responds successfully with an HTTP 200 status code" do
      get :sub_matrix
      expect(response).to have_http_status(200)
    end
  end

  context ""
end