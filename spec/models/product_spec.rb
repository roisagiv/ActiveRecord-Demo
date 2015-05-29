require 'rails_helper'

RSpec.describe Product, type: :model do
  it '#all should return 10,000 project' do
    expect(Product.count).to eq 10_000
  end

  it '#first product populate attributes with values' do
    product = Product.first
    expect(product.title).to eq 'ACADEMY ACADEMY'
    expect(product.actor).to eq 'PENELOPE GUINESS'
    expect(product.price).to eq 25.99
    expect(product.category.name).to eq 'Sci-Fi'
  end

  it '#maximum price should be 29.99' do
    expect(Product.maximum(:price)).to eq 29.99
  end

  it "#where product like 'ACADEMY' should return 1009 products" do
    expect(Product.where('title like ?', '%ACADEMY%').count).to eq 1009
  end

  it '#take products lazy loads category' do
    # Rails.logger.debug '===**** LAZY ****==='
    # Product.take(100).each do |product|
      # expect(product.category).not_to be_nil
    # end

    # include will eager load the category attribute
    Rails.logger.debug '===**** EAGER ****==='
    Product.includes(:category).take(100).each do |product|
      expect(product.category).not_to be_nil
    end
  end
end
