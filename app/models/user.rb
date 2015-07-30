class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :cars

	has_many(:reviews, :foreign_key => :reviewer_id)
	has_many(:feedback, :foreign_key => :review_subject_id, :class_name => "Review")

	has_many(:incoming_messages, :foreign_key => :to_id, :class_name => "User")
	has_many(:outgoing_message, :foreign_key => :from_id, :class_name => "User")

	has_many(:renter_chats, :foreign_key => :renter_id, :class_name => "User")
	has_many(:owner_chats, :foreign_key => :owner_id, :class_name => "User")

	has_many(:renter_rentals, :foreign_key => :renter_id, :class_name => "User")
	has_many(:owner_rentals, :foreign_key => :owner_id, :class_name => "User")
end