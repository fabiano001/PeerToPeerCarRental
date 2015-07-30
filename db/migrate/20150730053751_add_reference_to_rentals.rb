class AddReferenceToRentals < ActiveRecord::Migration
  def change
  	add_reference :rentals, :renter, references: :users
  	add_reference :rentals, :owner, references: :users
  end
end
