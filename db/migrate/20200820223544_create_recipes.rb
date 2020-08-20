class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :ingredients
      t.text :cook_method
      t.integer :difficulty
      
      t.timestamps
    end
  end
end
