class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products , status: 200
  end

  def show
    product = Product.find(params[:id])
    render json: ProductSerializer.new(product), status: 200
  end
end
