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
  end
end
