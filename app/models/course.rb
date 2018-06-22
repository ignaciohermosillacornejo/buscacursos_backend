class Course < ApplicationRecord
    has_many :reviews
    has_many :sections
end
