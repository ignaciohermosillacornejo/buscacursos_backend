# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@user = User.first

Review.create(user: @user, published_at: DateTime.now.beginning_of_day, state: 1, content: "Excelente review 1")
Review.create(user: @user, published_at: DateTime.now.beginning_of_day, state: 1, content: "Excelente review 2")
Review.create(user: @user, published_at: DateTime.now.beginning_of_day, state: 1, content: "Excelente review 3")
Review.create(user: @user, published_at: DateTime.now.beginning_of_day, state: 1, content: "Excelente review 4")
Review.create(user: @user, published_at: DateTime.now.beginning_of_day, state: 1, content: "Excelente review 5")
Review.create(user: @user, published_at: DateTime.now.beginning_of_day, state: 1, content: "Excelente review 6")
Review.create(user: @user, published_at: DateTime.now.beginning_of_day, state: 1, content: "Excelente review 7")


