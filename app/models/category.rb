class Category < ActiveRecord::Base
  alias_attribute :name, :categoryname
  has_many :products, foreign_key: 'category'

  def self.most_common_category
    Category.joins(:products)
    .group(:category, :categoryname)
    .order("count(products.category) DESC")
    .first
  end

  
end
