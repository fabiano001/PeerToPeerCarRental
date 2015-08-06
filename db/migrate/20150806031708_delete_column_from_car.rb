class DeleteColumnFromCar < ActiveRecord::Migration
  def change
  	remove_column :cars, :images
  end
end
