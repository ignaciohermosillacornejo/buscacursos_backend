json.status "succes"
json.data do
    json.number @course.number
    json.rooms do
        json.array @room_sections, partial: "courses/room", as: :room_section
    end
end