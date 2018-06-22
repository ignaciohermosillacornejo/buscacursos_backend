class Section < ApplicationRecord
    belongs_to :course
    has_many :room_sections
    has_many :rooms, through: :room_sections

    
end
