class Review < ApplicationRecord
	belongs_to :user
	belongs_to :course
	# TODO: validations
end
