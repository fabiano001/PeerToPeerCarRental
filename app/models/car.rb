class Car < ActiveRecord::Base
	validates :make, presence: true
	validates :model, presence: true
	validates :year, presence: true
	validates :type, presence: true
	validates :color, presence: true
	validates :body_type, presence: true
	validates :engine_type, presence: true
	validates :transmission, presence: true
	validates :description, presence: true
	validates :address, presence: true
	validates :city, presence: true
	validates :state, presence: true
	validates :driven_wheels, presence: true
	validates :vehichle_size, presence: true
	validates :fuel_type, presence: true
end
