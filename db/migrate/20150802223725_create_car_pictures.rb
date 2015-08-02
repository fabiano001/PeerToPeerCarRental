class CreateCarPictures < ActiveRecord::Migration
  def change
    create_table :car_pictures do |t|
      t.string :path

      t.timestamps null: false
    end
  end
end
