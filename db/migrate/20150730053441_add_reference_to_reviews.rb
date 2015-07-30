class AddReferenceToReviews < ActiveRecord::Migration
  def change
  	add_reference :reviews, :reviewer, references: :users
  	add_reference :reviews, :review_subject, references: :users
  end
end
