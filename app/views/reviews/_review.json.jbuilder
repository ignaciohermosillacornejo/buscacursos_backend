json.extract! review, :id, :created_at, :updated_at, :content
json.url review_url(review, format: :json)
json.author do
    json.first_name review.user.first_name
    json.last_name  review.user.last_name
    json.picture    review.user.picture
end
