class AddReferenceToMessages < ActiveRecord::Migration
  def change
	add_reference :messages, :chat, index: true, foreign_key: true
	add_reference :messages, :from, references: :users
	add_reference :messages, :to, references: :users
  end
end
