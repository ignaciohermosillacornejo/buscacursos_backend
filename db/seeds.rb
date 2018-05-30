# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@user = User.create(provider: "google_oauth2", uid: "112833290333535953002", email: "ithermosilla@uc.cl", first_name: "IGNACIO", last_name: "HERMOSILLA CORNEJO", picture: "https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAA...", admin: true, oauth_token: "SLA9mJkqGnoQuPHWeujqxRzZ", created_at: "2018-05-22 21:17:04", updated_at: "2018-05-23 06:43:40")

Course.create(name: "Desarrollo de Software", number: "IIC3143")
@course = Course.first

Review.create(course: @course, user: @user, published_at: DateTime.now.beginning_of_day, state: 1, content: "Hay que trabajar mucho")
Review.create(course: @course, user: @user, published_at: DateTime.now.beginning_of_day, state: 1, content: "No se puede faltar a clases!")
Review.create(course: @course, user: @user, published_at: DateTime.now.beginning_of_day, state: 1, content: "Buen ramo, hay que elegir un proyecto facil")
Review.create(course: @course, user: @user, published_at: DateTime.now.beginning_of_day, state: 1, content: "El ramo no tiene programa disponible")
Review.create(course: @course, user: @user, published_at: DateTime.now.beginning_of_day, state: 1, content: "Las pruebas son con computador y apuntes!")
Review.create(course: @course, user: @user, published_at: DateTime.now.beginning_of_day, state: 1, content: "TESTEA TODO!")
Review.create(course: @course, user: @user, published_at: DateTime.now.beginning_of_day, state: 1, content: "Lorem")





