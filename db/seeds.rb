require 'faker'

# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
# Create 20 Territories
Trip.destroy_all
20.times do
  trip = Trip.new({
    name:      Faker::Book.title,
    category:  [:ski, :snowboard, :other].sample(1).first,
    city:      Faker::Address.city,
    price_per_hour:     rand(1..90),
    guide_id:  [1, 2, 3].sample(1).first,
    picture:   'http://unsplash.it/800?random'
  })

  trip.save

end
