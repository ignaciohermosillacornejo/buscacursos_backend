json.status "succes"
json.data do
    json.partial! "courses/course", course: @course
end
