class AddReferenceToPictures < ActiveRecord::Migration
  def change
  	add_reference :pictures, :car, index: true, foreign_key: true
  end
end
