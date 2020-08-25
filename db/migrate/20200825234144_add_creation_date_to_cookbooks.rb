class AddCreationDateToCookbooks < ActiveRecord::Migration[6.0]
  def change
    add_column :cookbooks, :creation_date, :integer
  end
end
