# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
p "destroying db ...."


p "seeding Database"

10.times do
  user = User.new(
    email: Faker::SiliconValley.company ,
    password: Faker::SiliconValley.company ,
    )
  user.save
end

user_admin = User.create!(email: "dsqsd@gmail.com", password: "azerty")
user_admin.save

10.times do
  flat = Flat.create!(
    title: Faker::Coffee.variety,
    description: Faker::Coffee.notes,
    price: Faker::Number.between(10, 400),
    capacity: Faker::Number.between(1, 10),
    start_date: Faker::Date.between(Date.today, Date.today+1000),
    end_date: Faker::Date.between(Date.today, Date.today+1000),
    owner: User.sample
    )
end


# 10.times do
#   resa = Reservation.create!(
#      start_date: Faker::Date.between(Date.today, Date.today+1000),
#      end_date: Faker::Date.between(Date.today, Date.today+1000)
#     )
#   resa.save
#   end




