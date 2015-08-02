class AddReferenceToChats < ActiveRecord::Migration
  def change
	add_reference :chats, :renter, references: :users
	add_reference :chats, :owner, references: :users
  end
end
