class AddUserIdToCookbooks < ActiveRecord::Migration[6.0]
  def change
    add_column :cookbooks, :user_id, :integer
  end
end
