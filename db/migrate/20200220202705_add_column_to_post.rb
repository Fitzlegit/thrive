class AddColumnToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :membership_id, :integer
  end
end
