json.extract! review, :id, :created_at, :updated_at, :content
json.url review_url(review, format: :json)
json.author do
    json.partial! 'users/user',  user: review.user
end
json.like_total review.likes.length
json.like_authors do
    json.array! review.likes, partial: 'likes/like', as: :like
end