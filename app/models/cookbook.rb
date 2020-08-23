class Cookbook < ApplicationRecord
  belongs_to :user
  has_many :cookbook_recipes
  has_many :recipes, :through => :cookbook_recipes

  def recipes_attributes=(recipe)
    if recipe[:name]
  end
end
end
