class CreateCookbooks < ActiveRecord::Migration[6.0]
  def change
    create_table :cookbooks do |t|
      t.string :title
      t.string :author

      t.timestamps
    end
  end
end
