AdminUser.create!(user_name: 'admin', email: 'admin@example.com', password: '123456', password_confirmation: '123456', permission: 1)
AdminUser.create!(user_name: 'framgia', email: 'framgia@framgia.framgia', password: '123456', password_confirmation: '123456')

User.create!(name:  "framgia",
               email: "framgia@framgia.framgia",
               address: "framgia",
               phone: "framgia",
               password: "framgia",
               password_confirmation: "framgia")

30.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@gmail.com"
  password = "123456"
  address = Faker::Address.street_address
  phone = Faker::PhoneNumber.phone_number
  User.create!(name:  name,
               email: email,
               address: address,
               phone: phone,
               password: password,
               password_confirmation: password)
end

6.times do |i|
  2.times do
  2.times do |t|
    number_of_peoples = (i+1)
    description = Faker::Hobbit.character
    date = "2018-06-16"
    price = (i+1)*2
    type_table = t
    status = 2
    Table.create!(number_of_peoples:  number_of_peoples,
               description: description,
               date: date,
               price: price,
               type_table:type_table,
               status: status)
  end
  end
end

Category.create!(name: "breads")
Category.create!(name: "fruits")
Category.create!(name: "vegeCategorys")
Category.create!(name: "dairy foods")
Category.create!(name: "meat")
Category.create!(name: "snacks")
Category.create!(name: "candy")
Category.create!(name: "cereals")

10.times do |i|
  cates = Category.order(:name).take(8)
  cates.each do |cate|
    name = Faker::Food.dish
    price = Faker::Number.between(1, 500)
    description = Faker::Lorem.sentences
    rate_avg = Faker::Number.between(1, 5)
    cate.dishes.create!(
      name: name,
      price: price,
      description: description,
      rate_avg: rate_avg
    )
  end
end

10.times do
  new_contact = {
   first_name: Faker::Name.first_name,
   last_name: Faker::Name.last_name,
   email: Faker::Internet.email,
   subject: Faker::Food.dish,
   message: Faker::Lorem.sentences
  }
  Contact.create!(new_contact)
end

12.times do |i|
  id_fake = i + 1
  new_book = {
    table_id: id_fake,
    user_id: id_fake,
    time_start: "2018-06-22 18:15:00",
    time_end: "2018-06-22 20:15:00",
    price_table: Table.find(id_fake).price,
    status: 1
  }
  Booking.create!(new_book)
end

for i in 1..12
  booking_id = i
  for j in 1..4
    dish_id = j
    price = Dish.find(j).price
    quantity = 1
    new_details = {
      price: price,
      quantity: quantity,
      booking_id: booking_id,
      dish_id: dish_id
    }
    BookingDetail.create!(new_details)
  end
end

for i in 1..4
  dish_id = i
  4.times do
    content = Faker::Lorem.sentence(30)
    new_review = {
      content: content,
      dish_id: dish_id,
      admin_user_id: 1
    }
    Review.create!(new_review)
  end
end

for dish_id in 1..80
  for user_id in 1..8
    new_rating = {
      dish_id: dish_id,
      user_id: user_id,
      point: Faker::Number.between(1, 5)
    }
    Rating.create!(new_rating)
  end
end
