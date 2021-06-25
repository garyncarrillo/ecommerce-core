require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'validation' do
    it "ensure the presene of name" do
      product = Product.new(name: "", description: 'new product', price: 100000, weight: 100).save
      expect(product).to eq(false)
    end

    it "ensure the presene of description" do
      product = Product.new(name: "name", description: '', price: 100000, weight: 100).save
      expect(product).to eq(false)
    end

    it "ensure the presene of price" do
      product = Product.new(name: "name", description: 'description', weight: 100).save
      expect(product).to eq(false)
    end

    it "ensure the presene of weight" do
      product = Product.new(name: "name", description: 'description', price: 100000).save
      expect(product).to eq(false)
    end

    context "active tests" do

      let (:params) {{ name: "article no 1", description: 'description no 1', price: 100000, weight: 10 }}

      before(:each) do
        Product.new(params).save
        Product.new(params).save
        Product.new(params).save
        Product.new(params.merge(active: false)).save
        Product.new(params.merge(active: false)).save
        Product.new(params.merge(active: false)).save
      end

      it "should return active product" do
        expect(Product.active_products.size).to eq(3)
      end

      it "should return inactive product" do
        expect(Product.inactive_products.size).to eq(3)
      end

    end
  end
end
