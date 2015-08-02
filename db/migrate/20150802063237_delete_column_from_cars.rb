class DeleteColumnFromCars < ActiveRecord::Migration
  def change
  	remove_column :cars, :four_wheel_drive, :boolean
  end
end
