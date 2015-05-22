require 'rails_helper'

RSpec.describe Product, type: :model do
  
  it "#all should return 10,000 project" do
    expect(Product.count).to eq 10000 
  end

  it "#first product populate attributes with values" do
    product = Product.first
    expect(product.title).to eq "ACADEMY ACADEMY"
    expect(product.actor).to eq "PENELOPE GUINESS"
    expect(product.price).to eq 25.99
  end

  it "#maximum price should be 29.99" do
    expect(Product.maximum(:price)).to eq 29.99
  end

  it "#where product like 'ACADEMY' should return 1009 products" do
    expect(Product.where("title like ?","%ACADEMY%").count).to eq 1009
  end

end
