
10.times do |n|
  name = Faker::Hipster.word
  borsh = Rails.root.join('app/assets/images/b.jpg')
  
  dish = Dish.create!(name: name)
  path = "public/uploads/dish/picture/#{dish.id}"
  # target_filename = Rails.root.join("#{path}/b.jpg")
  
  FileUtils::mkdir_p path
  # FileUtils.copy(borsh, target_filename)
  
  borsh_url = 'https://monosnap.com/file/KxQJwN3MAxcn63WZeZZOyu1Ssmp2nb.png'
  dish.update_attributes(remote_picture_url: borsh_url)
  dish.save!
end