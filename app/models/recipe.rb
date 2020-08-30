class Recipe < ApplicationRecord
  has_many :cookbook_recipes
  # , dependent: :destroy
  has_many :cookbooks, :through => :cookbook_recipes

  validates :name, presence: true



  def cookbook_recipes_attributes=(cookbook_recipe)
    if !cookbook_recipe[:prep_time].blank? || !cookbook_recipe[:cook_time].blank?
      new_cookbook_recipe = self.cookbook_recipes.find_by(cookbook_id: cookbook_recipe["cookbook_id"], recipe_id: self.id)
      new_cookbook_recipe.update(prep_time: cookbook_recipe[:prep_time], cook_time: cookbook_recipe[:cook_time])
    end
  end

end
