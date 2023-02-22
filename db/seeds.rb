require "faker"

Restaurant.destroy_all
Review.destroy_all


5.times do
  restaurant_attr = {
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.cell_phone,
    category: %w(chinese italian japanese french belgian).sample
  }

  restaurant = Restaurant.create!(restaurant_attr)
  review_attr = {
    restaurant_id: restaurant.id,
    content: Faker::Restaurant.review,
    rating: 2
  }
  review = Review.create!(review_attr)
end
