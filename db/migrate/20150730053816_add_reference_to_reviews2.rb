class AddReferenceToReviews2 < ActiveRecord::Migration
  def change
  	add_reference :reviews, :rental, index: true, foreign_key: true
  end
end
