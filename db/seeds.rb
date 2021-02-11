# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning up database"

User.destroy_all
Game.destroy_all
Team.destroy_all
Event.destroy_all
Invite.destroy_all
puts "All clean"

role = ["Tank", "Healer", "DPS"] # 2 tanks, 2 healers, 4 DPS per team max
hours = (10..23)
half_hour = [3, 0]
start_time_hour = rand(hours)
end_time_hour = rand(hours)
if start_time_hour < end_time_hour
  start_time = "#{start_time_hour}:#{half_hour.sample}0:00"
  end_time = "#{end_time_hour}:#{half_hour.sample}0:00"
end
# Users
puts "Creating users"
# 10.times do
User.create(
  username: Faker::Games::Witcher.monster,
  email: "1@1.com",
  password: "123456",
  avatar: Faker::Avatar.image,
  nickname: Faker::Games::ElderScrolls.first_name,
  bio: Faker::Quote.matz,
  discord: "https://discord.gg/thisshouldnotworkhopefully",
  role: role.sample,
  sunday_start: start_time,
  sunday_end: end_time,
  monday_start: start_time,
  monday_end: end_time,
  tuesday_start: start_time,
  tuesday_end: end_time,
  wednesday_start: start_time,
  wednesday_end: end_time,
  thursday_start: start_time,
  thursday_end: end_time,
  friday_start: start_time,
  friday_end: end_time,
  saturday_start: start_time,
  saturday_end: end_time
)
# end
# Games only FFXIV
puts "Creating Game"
content = ["The Sirensong Sea", "Amaurot", "The Dying Gasp", "Anamnesis Anyder", "Mt. Gulg"]
# using top 50 or using API to seed
Game.create(
  title: "Final Fantasy XIV",
  content: content.sample
)

# Teams
puts "Creating Teams"
status = ["Open", "Closed"]
Team.create(
  name: Faker::Games::StreetFighter.stage,
  avatar: Faker::Avatar.image,
  bio: Faker::Games::StreetFighter.quote,
  discord: "https://discord.gg/thisshouldnotworkhopefullyteams",
  status: status.sample,
  user_id: User.last.id,
  game_id: Game.last.id
)

# Events
puts "Creating Events"
day = 1..7
Event.create(
  name: Faker::Games::Fallout.quote,
  description: Faker::Games::Overwatch.quote,
  day: rand(day),
  start_time: start_time,
  end_time: end_time,
  team_id: Team.last.id
)

# Applications no seed
