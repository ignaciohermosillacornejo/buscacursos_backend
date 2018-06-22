json.status "succes"
json.data do
    json.rooms do
        json.array! @room_sections, partial: "courses/room", as: :room_section
    end
end
