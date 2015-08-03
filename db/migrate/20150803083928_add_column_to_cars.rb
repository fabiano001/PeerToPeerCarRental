class AddColumnToCars < ActiveRecord::Migration
  def change
    add_column :cars, :images, :string
  end
end
