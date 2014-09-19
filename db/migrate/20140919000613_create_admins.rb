class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.integer :permissions_level

      t.timestamps
    end
  end
end
