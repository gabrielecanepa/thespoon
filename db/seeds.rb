puts 'Cleaning database...'
Restaurant.destroy_all

puts 'Creating restaurants...'
20.times do
  Restaurant.create!([
    {
      name:         Faker::Company.name,
      address:      "#{Faker::Address.street_address}, #{Faker::Address.street_address}",
      description:  "#{Faker::Company.catch_phrase}, #{Faker::Company.bs}.",
      stars:        rand(5) + 1,
      chef:         Faker::Name.name
    }
  ])
end

puts 'Finished!'
