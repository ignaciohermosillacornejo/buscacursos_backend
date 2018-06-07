class Like < ApplicationRecord
	belongs_to :user
	belongs_to :review
	# TODO: validations
end
