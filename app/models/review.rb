class Review < ApplicationRecord
	belongs_to :user
	belongs_to :course
	has_many :likes
	# TODO: validations
end
