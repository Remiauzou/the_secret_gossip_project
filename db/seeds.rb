require 'faker'

User.destroy_all
Gossip.destroy_all
Comment.destroy_all
City.destroy_all
Tag.destroy_all

20.times do |city|
	City.create!(name: Faker::Movies::LordOfTheRings.location, zip_code: Faker::Address.zip_code)
end

20.times do |user|
	User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::TvShows::Community.quotes, email: Faker::Internet.email, age: rand(10..74), city_id: City.all.sample.id, password: "azerty")
end

50.times do |gossip|
	Gossip.create!(title: Faker::Book.title, content: Faker::GreekPhilosophers.quote, user_id: User.all.sample.id)
end

20.times do |tag|
	Tag.create!(title: Faker::Book.genre)
end

30.times do |gossiptag|
	GossipsTag.create!(gossip_id: Gossip.all.sample.id, tag_id: Tag.all.sample.id)
end


30.times do |comment|
	Comment.create!(content: Faker::TvShows::FamilyGuy.quote, user_id: User.all.sample.id, gossip_id: Gossip.all.sample.id)
end
