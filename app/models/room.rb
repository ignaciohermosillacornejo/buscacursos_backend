class Room < ApplicationRecord
    has_many :room_sections
    has_many :sections, through: :room_sections
end
