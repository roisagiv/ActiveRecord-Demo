# Category class
class Category < ActiveRecord::Base
  alias_attribute :name, :categoryname
  has_many :products, foreign_key: 'category'
end
