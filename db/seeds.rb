require 'faker'

# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

# Create 20 Territories

20.times do
  # owner = User.all.sample(1).first
  trip = Trip.new({
    name:      Faker::Book.title,
    category:  [:ski, :snowboard, :autre].sample(1).first,
    city:      Faker::Address.city,
    price_per_hour:     rand(1..90),
    guide_id:  [1, 2, 3].sample(1).first,
  })

  trip.save

end
