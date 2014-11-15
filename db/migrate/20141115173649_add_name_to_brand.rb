class AddNameToBrand < ActiveRecord::Migration
  def change
  	add_column :brands, :name, :string
  	add_column :brands, :phone_number, :string
  end
end
