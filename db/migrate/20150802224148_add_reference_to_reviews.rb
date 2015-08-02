class AddReferenceToReviews < ActiveRecord::Migration
  def change
	add_reference :reviews, :reviewer, references: :users
	add_reference :reviews, :review_subject, references: :users
	add_reference :reviews, :rental, index: true, foreign_key: true
  end
end
