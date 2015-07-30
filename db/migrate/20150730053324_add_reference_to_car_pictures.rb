class AddReferenceToCarPictures < ActiveRecord::Migration
  def change
  	add_reference :car_pictures, :car, index: true, foreign_key: true
  end
end
