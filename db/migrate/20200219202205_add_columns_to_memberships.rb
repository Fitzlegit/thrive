class AddColumnsToMemberships < ActiveRecord::Migration[6.0]
  def change
    add_column :memberships, :user_id, :integer
    add_column :memberships, :group_id, :integer
  end
end
