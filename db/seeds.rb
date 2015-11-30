
10.times do |n|
  name = Faker::Hipster.word
  picture = Faker::Avatar.image("my-own-slug", "50x50")
  Dish.create!(name: name, picture: picture)
end