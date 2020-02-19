class CreateMemberships < ActiveRecord::Migration[6.0]
  def change
    create_table :memberships do |t|
      t.string :group, null: false, default: ''
      t.string :type, null: false, default: 'student'

      t.timestamps
    end
  end
end
