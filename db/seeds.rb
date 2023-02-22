require 'faker'

puts "Cleaning database..."

Restaurant.destroy_all
Review.destroy_all
puts "Creating restaurants & reviews..."

5.times do
  restaurant_attr = {
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.cell_phone,
    category: %w(chinese italian japanese french belgian).sample
  }

  restaurant = Restaurant.create!(restaurant_attr)

  5.times do
  review_attr = {
    restaurant_id: restaurant.id,
    content: Faker::Restaurant.review,
    rating: rand(0..5)
  }
  review = Review.create!(review_attr)
  end
end

puts "Finished!"
