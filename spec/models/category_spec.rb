require 'rails_helper'

RSpec.describe Category, type: :model do
  it '#all should return 16 project' do
    expect(Category.count).to eq 16
  end

  it '#first product populate attributes with values' do
    category = Category.first
    expect(category.name).to eq 'Action'
  end

  it '#all products are populated' do
    # Rails.logger.debug '===**** LAZY ****==='
    # Category.all.each do |category|
      # expect(category.products).to have_at_least(1).items
    # end

    Rails.logger.debug '===**** EAGER ****==='
    Category.eager_load(:products).all.each do |category|
      expect(category.products).to have_at_least(1).items
    end
  end
end
