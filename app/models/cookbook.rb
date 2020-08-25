class Cookbook < ApplicationRecord
  belongs_to :user
  has_many :cookbook_recipes, dependent: :destroy
  has_many :recipes, :through => :cookbook_recipes

  validates :title, presence: true
  validates :author, presence: true


  def self.traditional_cookbooks
    where('creation_date <= 1970')
  end

  def self.modern_cookbooks
    where('creation_date >= 1971')
  end

  def self.foreign_cuisine_cookbooks
    where('creation_date >= 2000')
  end

  def self.other_cookbooks
    where('creation_date >= 2020')
  end

  def recipes_attributes=(recipe)
    if recipe[:name] != "" && recipe[:ingredients] != "" &&
       recipe[:cook_method] != "" && recipe[:difficulty] != ""
       new_recipe = self.recipes.build
       new_recipe.name = recipe[:name]
       new_recipe.ingredients = recipe[:ingredients]
       new_recipe.cook_method = recipe[:cook_method]
       new_recipe.difficulty = recipe[:difficulty]
    end
  end
end
