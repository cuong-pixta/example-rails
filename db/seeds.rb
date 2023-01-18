# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Micropost.create([{user_id: 1, content: "This is content" }, {user_id: 3, content: "This is content"}])

users = User.order(:created_at).take(6)
50.times do 
  users.each { |user| user.microposts.create!(content: "this is content") }
end