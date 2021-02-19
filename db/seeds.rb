puts "Cleaning up database"

Event.destroy_all
Team.destroy_all
Game.destroy_all
User.destroy_all
Invite.destroy_all
puts "All clean"


# Users
puts "Creating random times"
puts "Creating users"
n = 0
role = ["Tank", "Healer", "DPS"] # 2 tanks, 2 healers, 4 DPS per team max
def random_start_end_time(start_time, end_time)
  array = []
  half_hour = [3, 0] # usage: #{half_hour.sample}
  if start_time < end_time
    array << "#{start_time}:00:00"
    array << "#{end_time}:00:00"
    return array
  else
    array << "#{end_time}:00:00"
    array << "#{start_time}:00:00"
    return array
  end
end
80.times do
  # valid start and end time
  # each weekday start and end time
  days_times = []
  7.times do
    days_times << random_start_end_time(rand(10..23), rand(10..23))
  end

  User.create(
    username: Faker::Games::Witcher.monster,
    email: "#{n+=1}@#{n+=1}.com",
    password: "123456",
    avatar: Faker::Avatar.image,
    nickname: Faker::Games::ElderScrolls.first_name,
    bio: Faker::Quote.matz,
    discord: "https://discord.gg/thisshouldnotworkhopefully",
    role: role.sample,
    sunday_start: days_times[0][0],
    sunday_end: days_times[0][1],
    monday_start: days_times[1][0],
    monday_end: days_times[1][1],
    tuesday_start: days_times[2][0],
    tuesday_end: days_times[2][1],
    wednesday_start: days_times[3][0],
    wednesday_end: days_times[3][1],
    thursday_start: days_times[4][0],
    thursday_end: days_times[4][1],
    friday_start: days_times[5][0],
    friday_end: days_times[5][1],
    saturday_start: days_times[6][0],
    saturday_end: days_times[6][1]
  )
end
puts "Done"
# Games only FFXIV for now
puts "Creating Game"
content = ["The Sirensong Sea", "Amaurot", "The Dying Gasp", "Anamnesis Anyder", "Mt. Gulg"]
# using top 50 or using API to seed
Game.create(
  title: "Final Fantasy XIV",
  content: content.sample
)
puts "Done"

# Teams
puts "Creating Teams"
users_for_seed = User.all
10.times do
  status = [0, 1] # 0 is closed, 1 is open, 2 pending?
  Team.create(
    name: Faker::Games::StreetFighter.stage,
    avatar: Faker::Avatar.image,
    bio: Faker::Games::StreetFighter.quote,
    discord: "https://discord.gg/thisshouldnotworkhopefullyteams",
    status: status.sample,
    user_id: users_for_seed.sample.id,
    game_id: Game.last.id
  )
end
puts "Done"

# Invites
#Creating teams with members via invites (status 0 declined, 1 accepted, 2 pending?)
puts "Creating Teams with members"
teams_for_seed = Team.all
30.times do
  Invite.create(
    status: 1,
    user: users_for_seed.sample,
    team: teams_for_seed.sample
  )
end

puts "Creating pending Invites"
15.times do
  Invite.create(
    status: 2,
    user: users_for_seed.sample,
    team: teams_for_seed.sample
  )
end

puts "Creating declined Invites"
10.times do
  Invite.create(
    status: 0,
    user: users_for_seed.sample,
    team: teams_for_seed.sample
  )
end
puts "Done"

# Events
puts "Creating Events"
50.times do
  days_times_events = []
  days_times_events << random_start_end_time(rand(9..23), rand(9..23))
  day = 1..7
  teams_for_seed = Team.all
  Event.create(
    name: Faker::Games::Fallout.quote,
    description: Faker::Games::Overwatch.quote,
    day: rand(day),
    start_time: days_times_events[0][0],
    end_time: days_times_events[0][1],
    team_id: teams_for_seed.sample.id
  )
end
puts "Done"
