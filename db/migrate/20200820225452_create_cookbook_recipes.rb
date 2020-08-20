class CreateCookbookRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :cookbook_recipes do |t|
      t.integer :cookbook_id
      t.integer :recipe_id
      t.integer :cook_time
      t.integer :prep_time
      t.timestamps
    end
  end
end
