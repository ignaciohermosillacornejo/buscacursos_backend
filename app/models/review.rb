class Review < ApplicationRecord
	belongs_to :user
	belongs_to :course
	has_many :likes
	has_many :reports
	# TODO: validations
end
