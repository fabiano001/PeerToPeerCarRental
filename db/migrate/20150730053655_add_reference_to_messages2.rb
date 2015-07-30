class AddReferenceToMessages2 < ActiveRecord::Migration
  def change
  	add_reference :messages, :chat, index: true, foreign_key: true
  end
end
