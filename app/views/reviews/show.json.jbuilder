json.status "succes"
json.data do
    json.extract! @course, :id, :name, :number, :created_at, :updated_at
    json.url course_url(@course, format: :json)
    json.reviews do
        json.array! [@review], partial: 'reviews/review', as: :review
    end
end


