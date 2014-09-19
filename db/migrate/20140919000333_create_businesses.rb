class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.integer :user_id
      t.string :name
      t.string :primary_contact_first
      t.string :primary_contact_last
      t.string :phone_number

      t.timestamps
    end
  end
end
