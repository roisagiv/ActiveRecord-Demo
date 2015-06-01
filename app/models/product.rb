class Product < ActiveRecord::Base
  # self.table_name = 'legacy_table_name'
  # alias_attribute :title :legacy_title
  belongs_to :category, foreign_key: 'category'

  def self.most_expensive_products
    Product.where(:price => Product.maximum(:price))
  end
end
