require 'rails_helper'

RSpec.describe ProductsController , type: :controller do
  context "GET /index" do

    it "return a sucess response" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  context "GET /show" do

    it "return a sucess response" do
      product = Product.create!(name: "article no 1 ", description: "descrription no 1", price: 100, weight: 100)
      get :show, params: { id: product.id }
      expect(response).to have_http_status(:success)
    end

    it "JSON body response contains expect recibe attributes" do
      product = Product.create!(name: "article no 1 ", description: "descrription no 1", price: 100, weight: 100)
      get :show, params: { id: product.id }
      json_response = JSON.parse(response.body)
      
      expect(json_response.keys).to match_array([
        "id",
        "name",
        "description",
        "price",
        "weight",
        "created_at",
        "updated_at",
        "active"
      ])
    end
 end
end
