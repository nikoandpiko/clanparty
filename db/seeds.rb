puts "Cleaning up database"


Event.destroy_all
Invite.destroy_all
# User.all.order(id: :desc).each{ |user| user.delete }
User.delete_all
Team.destroy_all
Game.destroy_all

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
    days_times << random_start_end_time(rand(8..21), rand(8..21))
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

puts "Create User without schedule"
User.create(
  username: "CrazyGamer",
  email: "1@1.com",
  password: 123456,
  nickname: "KillOnDemand",
  bio: "Just look at my stats and start crying since you will never get as good as me.",
  discord: "https://discord.gg/crazyLWT",
  role: role.sample
)
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
8.times do
  status = [0, 1] # 0 is closed, 1 is open, 2 pending?
  user = users_for_seed.sample
  Team.create(
    name: Faker::Games::StreetFighter.stage,
    avatar: Faker::Avatar.image,
    bio: Faker::Games::StreetFighter.quote,
    discord: "https://discord.gg/thisshouldnotworkhopefullyteams",
    status: status.sample,
    user_id: user.id,
    game_id: Game.last.id
  )
  team = Team.last
  user.update(team_id: team.id)
end
puts "Done"

# Invites
#Creating teams with members via invites (status 0 declined, 1 accepted, 2 pending?)
puts "Creating Teams with members"
teams_for_seed = Team.all
30.times do
  user = users_for_seed.sample

  if user.team_id.nil?
    Invite.create(
      status: 1,
      user: users_for_seed.sample,
      team: teams_for_seed.sample
    )
  end
end

puts "Creating pending Invites"
15.times do
  user = users_for_seed.sample

  if user.team_id.nil?
    Invite.create(
      status: 2,
      user: users_for_seed.sample,
      team: teams_for_seed.sample
    )
  end
end

puts "Creating declined Invites"
10.times do
  user = users_for_seed.sample

  if user.team_id.nil?
    Invite.create(
      status: 0,
      user: users_for_seed.sample,
      team: teams_for_seed.sample
    )
  end
end
puts "Done"

# Events
puts "Creating Events"
50.times do
  days_times_events = []
  days_times_events << random_start_end_time(rand(8..21), rand(8..21))
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
puts "Creating Crazy Gamer user"
User.create(
  username: "CrazyGamer",
  email: "1@1.com",
  password: 123456,
  nickname: "KillOnDemand",
  avatar: Faker::Avatar.image,
  bio: "Just look at my stats and start crying since you will never get as good as me.",
  discord: "https://discord.gg/crazyLWT",
  role: role.sample
)

puts "Done"

tenchu = "https://img2.finalfantasyxiv.com/f/005008c9b9715d8d06de3b85e2f33f8b_7bb6b1e488f0e4f01c5314d010b60f31fc0_96x96.jpg"
lumina = "https://img2.finalfantasyxiv.com/f/8be64905c8f20cb0e5401ba9e49a657d_7bb6b1e488f0e4f01c5314d010b60f31fc0_96x96.jpg"
alphi = "https://img2.finalfantasyxiv.com/f/f763c17d715ccb647ff8445143e56c2f_7bb6b1e488f0e4f01c5314d010b60f31fc0_96x96.jpg"
kiri = "https://img2.finalfantasyxiv.com/f/fdfdc11c9dd9f038c3f3c80e52b3d896_7bb6b1e488f0e4f01c5314d010b60f31fc0_96x96.jpg"
lucis = "https://img2.finalfantasyxiv.com/f/62a402958c0d0bf9a15be82bfec38996_7bb6b1e488f0e4f01c5314d010b60f31fc0_96x96.jpg"
sille = "https://img2.finalfantasyxiv.com/f/7317268cbe7945c16096518be14fce10_7bb6b1e488f0e4f01c5314d010b60f31fc0_96x96.jpg"
hanska = "https://img2.finalfantasyxiv.com/f/f25a935a9b6eeb8a7392afe69166939f_7bb6b1e488f0e4f01c5314d010b60f31fc0_96x96.jpg"
vesper = "https://img2.finalfantasyxiv.com/f/4dfd463580443d92244b2e0005623173_7bb6b1e488f0e4f01c5314d010b60f31fc0_96x96.jpg"

puts "Creating 8 Users with proper Avatar"
User.create(
  username: "Tenchu",
  email: "tenchu@1.com",
  password: 123456,
  nickname: "Tenchu",
  avatar: tenchu,
  bio: "Just look at my stats and start crying since you will never get as good as me.",
  discord: "https://discord.gg/crazyLWT",
  role: role.sample
)

User.create(
  username: "Lumina",
  email: "lumina@1.com",
  password: 123456,
  nickname: "lumina",
  avatar: lumina,
  bio: "Just look at my stats and start crying since you will never get as good as me.",
  discord: "https://discord.gg/crazyLWT",
  role: role.sample
)

User.create(
  username: "Alphi",
  email: "alphi@1.com",
  password: 123456,
  nickname: "Alphi",
  avatar: alphi,
  bio: "Just look at my stats and start crying since you will never get as good as me.",
  discord: "https://discord.gg/crazyLWT",
  role: role.sample
)

User.create(
  username: "Kiri",
  email: "kiri@1.com",
  password: 123456,
  nickname: "Kiri",
  avatar: kiri,
  bio: "Just look at my stats and start crying since you will never get as good as me.",
  discord: "https://discord.gg/crazyLWT",
  role: role.sample
)

User.create(
  username: "Lucis",
  email: "lucis@1.com",
  password: 123456,
  nickname: "Lucis",
  avatar: lucis,
  bio: "Just look at my stats and start crying since you will never get as good as me.",
  discord: "https://discord.gg/crazyLWT",
  role: role.sample
)

User.create(
  username: "Sille",
  email: "sille@1.com",
  password: 123456,
  nickname: "Sille",
  avatar: sille,
  bio: "Just look at my stats and start crying since you will never get as good as me.",
  discord: "https://discord.gg/crazyLWT",
  role: role.sample
)

User.create(
  username: "Hanska",
  email: "hanska@1.com",
  password: 123456,
  nickname: "Hanska",
  avatar: hanska,
  bio: "Just look at my stats and start crying since you will never get as good as me.",
  discord: "https://discord.gg/crazyLWT",
  role: role.sample
)

User.create(
  username: "Vesper",
  email: "vesper@1.com",
  password: 123456,
  nickname: "Vesper",
  avatar: vesper,
  bio: "Just look at my stats and start crying since you will never get as good as me.",
  discord: "https://discord.gg/crazyLWT",
  role: role.sample
)

puts "Done"

puts "Creating Team with special special Team-leader"

8.times do
  status = [0, 1] # 0 is closed, 1 is open, 2 pending?
  user_special = User.find_by(username: "Tenchu")
  Team.create(
    name: "Swordies",
    avatar: "https://www.pngfind.com/pngs/m/446-4461774_final-fantasy-gilgamesh-swords-hd-png-download.png",
    bio: "TEAM: Together Everyone Achieves More.",
    discord: "https://discord.gg/thisshouldnotworkhopefullyteams",
    status: 1,
    user_id: user_special.id,
    game_id: Game.last.id
  )
  team = Team.last
  user_special.update(team_id: team.id)
end

puts "Done"

puts "Creating accepted invites to special team"

team_special = Team.last
user_1 = User.find_by(username: "Lumina")
user_2 = User.find_by(username: "Alphi")
user_3 = User.find_by(username: "Kiri")
user_4 = User.find_by(username: "Lucis")
user_5 = User.find_by(username: "Sille")
user_6 = User.find_by(username: "Hanska")
user_7 = User.find_by(username: "Vesper")

if user_1.team_id.nil?
  Invite.create(
    status: 1,
    user: user_1,
    team: team_special
  )
end

if user_2.team_id.nil?
  Invite.create(
    status: 1,
    user: user_2,
    team: team_special
  )
end

if user_3.team_id.nil?
  Invite.create(
    status: 1,
    user: user_3,
    team: team_special
  )
end

if user_4.team_id.nil?
  Invite.create(
    status: 1,
    user: user_4,
    team: team_special
  )
end

if user_5.team_id.nil?
  Invite.create(
    status: 1,
    user: user_5,
    team: team_special
  )
end

puts "Creating pending invite to special team"

if user_6.team_id.nil?
  Invite.create(
    status: 2,
    user: user_6,
    team: team_special
  )
end

if user_7.team_id.nil?
  Invite.create(
    status: 2,
    user: user_7,
    team: team_special
  )
end

puts "Done"

puts "Creating events for special team"

3.times do
  days_times_events = []
  days_times_events << random_start_end_time(rand(8..21), rand(8..21))
  day = 1..7
  teams_for_seed = Team.all
  Event.create(
    name: Faker::Games::Fallout.quote,
    description: Faker::Games::Overwatch.quote,
    day: rand(day),
    start_time: days_times_events[0][0],
    end_time: days_times_events[0][1],
    team_id: team_special.id
  )
end

puts "Creating team without user id"

Team.create(
  name: "Loosies",
  avatar: "https://www.pngfind.com/pngs/m/446-4461774_final-fantasy-gilgamesh-swords-hd-png-download.png",
  bio: "We shouldnt exist!",
  discord: "https://discord.gg/thisshouldnotworkhopefullyteams",
  status: 1,
  game_id: Game.last.id
)

puts "All finished"
