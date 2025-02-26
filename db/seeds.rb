# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning database..."
Flat.destroy_all

10.times do
  Flat.create!(name:"Flat closes to #{Faker::Travel::TrainStation.name(region: 'united_kingdom', type: 'metro')}",
              address:Faker::Locations::Australia.location,
              description:Faker::Quotes::Shakespeare.hamlet_quote,
              price_per_night:(50..150).to_a.sample,
              number_of_guests: (1..5).to_a.sample)
end

puts "Finished! Created #{Flat.count} flats."
