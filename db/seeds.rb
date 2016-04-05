# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name: "Anderson Vankayala", email: "andersonpaac@gmail.com", socialuname: "@andersonpaac",
             socialpwd: "somepassword")

User.create!(name: "Roy Li", email: "royli@gmail.com", socialuname: "@royli", socialpwd: "somepass")

Action.create!(message: 'drunk', social_username:'andersonpaac@gmail.com')
Action.create!(message: 'food', social_username: 'royli@gmail.com')

400.times do |n|
  restaurants_suffix = ['burger', 'deli', 'foods', 'boulangerie', 'patisserie', "'s Place'", 'restaurant', 'bakery']
  generic = ["Burger King", "McDonalds", "Taco Bell", "Applebee's"]
  if Random.new_seed % 3 == 0
    name = generic[Random.new_seed % generic.length]
  else
    name = Faker::Name.name
    name = name + " " + restaurants_suffix[Random.new_seed % restaurants_suffix.length]
  end
  address = Faker::Address.street_name
  address = address + ', ' + Faker::Address.street_address + ', ' + Faker::Address.zip
  Destination.create!(name: name, address: address)

end