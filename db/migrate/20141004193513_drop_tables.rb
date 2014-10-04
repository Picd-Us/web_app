class DropTables < ActiveRecord::Migration
  def change
  	drop_table :admins
  	drop_table :businesses
  	drop_table :people
  	drop_table :roles
  end
end
