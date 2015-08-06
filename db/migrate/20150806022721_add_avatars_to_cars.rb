class AddAvatarsToCars < ActiveRecord::Migration
  def change
    add_column :cars, :avatars, :json
  end
end
