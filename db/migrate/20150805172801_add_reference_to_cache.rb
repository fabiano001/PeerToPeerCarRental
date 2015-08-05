class AddReferenceToCache < ActiveRecord::Migration
  def change
  	add_reference :caches, :user, index: true, foreign_key: true
  end
end
