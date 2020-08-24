class Recipe < ApplicationRecord
  has_many :cookbook_recipes, dependent: :destroy
  has_many :cookbooks, :through => :cookbook_recipes

end
