class Cookbook < ApplicationRecord
  belongs_to :user
  has_many :cookbook_recipes, dependent: :destroy
  has_many :recipes, :through => :cookbook_recipes

  validates :title, presence: true 
  validates :author, presence: true

  def recipes_attributes=(recipe)
    if recipe[:name] != "" && recipe[:ingredients] != "" &&
       recipe[:cook_method] != "" && recipe[:difficulty] != ""
       new_recipe = self.recipes.build
       new_recipe.name = recipe[:name]
       new_recipe.ingredients = recipe[:ingredients]
       new_recipe.cook_method = recipe[:cook_method]
       new_recipe.difficulty = recipe[:difficulty].to_i
    end
  end
end
