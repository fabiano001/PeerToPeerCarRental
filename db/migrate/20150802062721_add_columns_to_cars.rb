class AddColumnsToCars < ActiveRecord::Migration
  def change
  	add_column :cars, :price, :integer
	add_column :cars, :address, :string
	add_column :cars, :city, :string
	add_column :cars, :state, :string
	add_column :cars, :driven_wheels, :string
	add_column :cars, :vehichle_size, :string
	add_column :cars, :fuel_type, :string
	add_column :cars, :antilock_brake_system, :boolean
  end
end
