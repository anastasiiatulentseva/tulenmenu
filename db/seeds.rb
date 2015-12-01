
10.times do |n|
  name = Faker::Hipster.word
  borsh = Rails.root.join('app/assets/images/b.jpg')
  
  dish = Dish.create!(name: name)
  path = "public/uploads/dish/picture/#{dish.id}"
  # target_filename = Rails.root.join("#{path}/b.jpg")
  
  FileUtils::mkdir_p path
  # FileUtils.copy(borsh, target_filename)
  
  borsh_url = 'https://static-s.aa-cdn.net/img/ios/921356214/bae18a5601b99e62a7879edb5b7c1e34?v=1'
  dish.update_attributes(remote_picture_url: borsh_url)
  dish.save!
end