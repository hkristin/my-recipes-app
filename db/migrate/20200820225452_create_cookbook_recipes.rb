class CreateCookbookRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :cookbook_recipes do |t|

      t.timestamps
    end
  end
end
