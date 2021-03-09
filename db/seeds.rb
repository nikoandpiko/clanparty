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
60.times do
  # valid start and end time
  # each weekday start and end time
  days_times = []
  7.times do
    days_times << random_start_end_time(rand(17..22), rand(18..23))
  end
  random_stats = rand(57..98)
  random_servers = ["Tonberry", "Ramuh", "Kujata", "Gungnir"]
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
    saturday_end: days_times[6][1],
    stats: random_stats,
    server: random_servers[0]
  )
end
puts "Done"





# puts "Create User without schedule"
# User.create(
#   username: "CrazyGamer",
#   email: "1@1.com",
#   password: 123456,
#   nickname: "KillOnDemand",
#   bio: "Just look at my stats and start crying since you will never get as good as me.",
#   discord: "https://discord.gg/crazyLWT",
#   role: role.sample
# )
# Games only FFXIV for now
puts "Creating Game"
content = ["The Sirensong Sea", "Amaurot", "The Dying Gasp", "Anamnesis Anyder", "Mt. Gulg"]
# using top 50 or using API to seed
Game.create(
  title: "Final Fantasy XIV",
  content: content.sample
)
puts "Done"

team_avatars = ["https://p56.f1.n0.cdn.getcloudapp.com/items/KouZRv5y/f56173f2-9f65-4517-bfc7-f5131614d778.png?source=viewer&v=f539594bf7f8cae6e0b8135e94ea45d3", "https://p56.f1.n0.cdn.getcloudapp.com/items/E0u9NDNg/7dc60225-dc10-43a4-8a68-081e5bdae894.png?v=844ba18244dacf2993f05bbffeb774cb", "https://p56.f1.n0.cdn.getcloudapp.com/items/OAugdpdO/b6aaa139-ad5f-4b62-9130-61f8a2d77bbe.png?source=viewer&v=0544fcf6fa673ad08fd0f02a5d89e82d", "https://p56.f1.n0.cdn.getcloudapp.com/items/kpu7zpzB/8e22f29a-3e14-4c4c-b23e-273124c2c2e5.png?v=aa4be8a1385517727cc6523f6f6882a6", "https://p56.f1.n0.cdn.getcloudapp.com/items/jkuejz0B/7ecf6b02-9ffa-4261-84c9-489cc302e466.png?v=5047114880564b11ced43f6b43795111", "https://p56.f1.n0.cdn.getcloudapp.com/items/WnuB5LWD/28279e45-ce88-4e0e-a7c9-494ce97657f3.png?v=3c9cb7153b6c0f2b37ae09a366877a61", "https://p56.f1.n0.cdn.getcloudapp.com/items/bLugNXZ2/4328c4ba-8b8b-4b49-b6a6-675100478fd8.png?v=320ad518f62a448557fa35052d404caf"]
# Teams
puts "Creating Teams"
users_for_seed = User.all
7.times do
  status = [0, 1] # 0 is closed, 1 is open, 2 pending?
  user = users_for_seed.sample
  Team.create(
    name: Faker::Games::StreetFighter.stage,
    avatar: team_avatars.shuffle!.pop,
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
40.times do
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
10.times do
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
5.times do
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

puts "Creating unassigned Invites"
10.times do
  user = users_for_seed.sample

  if user.team_id.nil?
    Invite.create(
      status: 3,
      user: users_for_seed.sample
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
    # name: Faker::Games::Fallout.quote,
    name: content.sample,
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
  nickname: "Tenchu Muyo",
  avatar: tenchu,
  bio: "Just look at my stats and start crying since you will never get as good as me.",
  discord: "361828201426714625",
  role: role[0],
  server: "Tonberry",
  stats: 81
)

User.create(
  username: "Lumina",
  email: "lumina@1.com",
  password: 123456,
  nickname: "Lumina Moonfang",
  avatar: lumina,
  bio: "Just look at my stats and start crying since you will never get as good as me.",
  discord: "https://discord.gg/crazyLWT",
  role: role[1],
  server: "Tonberry",
  stats: 99
)

User.create(
  username: "Alphiria",
  email: "alphi@1.com",
  password: 123456,
  nickname: "Alphiria Reinhir",
  avatar: alphi,
  bio: "Just look at my stats and start crying since you will never get as good as me.",
  discord: "https://discord.gg/crazyLWT",
  role: role[2],
  server: "Tonberry",
  stats: 99
)

User.create(
  username: "Kiriri",
  email: "kiri@1.com",
  password: 123456,
  nickname: "Kiriri Kiri",
  avatar: kiri,
  bio: "Just look at my stats and start crying since you will never get as good as me.",
  discord: "https://discord.gg/crazyLWT",
  role: role[2],
  server: "Tonberry",
  stats: 94
)

User.create(
  username: "Lucis",
  email: "lucis@1.com",
  password: 123456,
  nickname: "Lucis Ventus",
  avatar: lucis,
  bio: "Just look at my stats and start crying since you will never get as good as me.",
  discord: "https://discord.gg/crazyLWT",
  role: role[0],
  server: "Tonberry",
  stats: 80
)

User.create(
  username: "Sille",
  email: "sille@1.com",
  password: 123456,
  nickname: "Sille Kupo",
  avatar: sille,
  bio: "Just look at my stats and start crying since you will never get as good as me.",
  discord: "https://discord.gg/crazyLWT",
  role: role[2],
  server: "Tonberry",
  stats: 76
)

User.create(
  username: "Hanska",
  email: "hanska@1.com",
  password: 123456,
  nickname: "Hanska Bhelen",
  avatar: hanska,
  bio: "Just look at my stats and start crying since you will never get as good as me.",
  discord: "https://discord.gg/crazyLWT",
  role: role[2],
  server: "Tonberry",
  stats: 84
)

User.create(
  username: "Aurora",
  email: "vesper@1.com",
  password: 123456,
  nickname: "Aurora Vesper",
  avatar: vesper,
  bio: "Playing FF since 2019. Maybe not the best, but daily online! High level Healer and if necessary can be Tank too!",
  discord: "204311541561032704",
  role: role[1],
  server: "Tonberry",
  stats: 80
)

puts "Done"

puts "Creating Team with special special Team-leader"

status = [0, 1] # 0 is closed, 1 is open, 2 pending?
user_special = User.find_by(username: "Tenchu")
old_pic = "https://www.pngfind.com/pngs/m/446-4461774_final-fantasy-gilgamesh-swords-hd-png-download.png"
new_pic2 = "https://assets.rpglogs.com/img/ff/bosses/75-icon.jpg"
new_pic = "https://p56.f1.n0.cdn.getcloudapp.com/items/xQunkGk5/1348a123-e9b1-45b9-b5f0-753877cea6ca.png?source=viewer&v=89c1c68cf6be9bb60184e3d8cb58091e"
Team.create(
  name: "Fatebreaker Savage",
  avatar: new_pic,
  bio: "TEAM: Together Everyone Achieves More.",
  discord: "https://discord.gg/Gw8cmHShnV",
  status: 1,
  user_id: user_special.id,
  game_id: Game.last.id
)
team = Team.last
user_special.update(team_id: team.id)

puts "Done"

puts "Creating accepted invites to special team"

team_special = Team.last
user_1 = User.find_by(username: "Lumina")
user_2 = User.find_by(username: "Alphiria")
user_3 = User.find_by(username: "Kiriri")
user_4 = User.find_by(username: "Lucis")
user_5 = User.find_by(username: "Sille")
user_6 = User.find_by(username: "Hanska")
user_7 = User.find_by(username: "Aurora")

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

if user_6.team_id.nil?
  Invite.create(
    status: 1,
    user: user_6,
    team: team_special
  )
end
puts "Creating pending invite to special team"


if user_7.team_id.nil?
  Invite.create(
    status: 2,
    user: user_7,
    team: team_special
  )
end

User.create(
  username: "Ludacris",
  email: "ludacris@1.com",
  password: 123456,
  nickname: "Ludacris Angmar",
  avatar: Faker::Avatar.image,
  bio: "Pro Gamer since 2008. Teams only win because of my skills. Not wasting my time with loosers. Only winner teams please. LETS GO AND RAID!",
  discord: "812607345414766602",
  role: role[1],
  server: "Tonberry",
  stats: 74
)

user_9 = User.find_by(username: "Ludacris")
if user_9.team_id.nil?
  Invite.create(
    status: 2,
    user: user_9,
    team: team_special
  )
end



puts "Done"

puts "Creating events for special team"

days_times_events = []
days_times_events << random_start_end_time(rand(8..21), rand(8..21))
day = 1..7
teams_for_seed = Team.all
Event.create(
  name: content[2],
  description: Faker::Games::Overwatch.quote,
  day: rand(day),
  start_time: days_times_events[0][0],
  end_time: days_times_events[0][1],
  team_id: team_special.id
)

Event.create(
  name: content[4],
  description: Faker::Games::Overwatch.quote,
  day: rand(day),
  start_time: days_times_events[0][0],
  end_time: days_times_events[0][1],
  team_id: team_special.id
)

Event.create(
  name: content[1],
  description: Faker::Games::Overwatch.quote,
  day: rand(day),
  start_time: days_times_events[0][0],
  end_time: days_times_events[0][1],
  team_id: team_special.id
)


puts "Creating team without user id"

Team.create(
  name: "Loosies",
  avatar: "https://www.pngfind.com/pngs/m/446-4461774_final-fantasy-gilgamesh-swords-hd-png-download.png",
  bio: "We shouldnt exist!",
  discord: "https://discord.gg/thisshouldnotworkhopefullyteams",
  status: 1,
  game_id: Game.last.id
)

puts "creating spec user"

2.times do
  # valid start and end time
  # each weekday start and end time
  usernamez = ["WOW", "YEAH"]
  days_times = []
  7.times do
    days_times << random_start_end_time(rand(17..19), rand(20..23))
  end

  User.create(
    username: usernamez.sample,
    email: "#{n += 1}@#{n += 1}.com",
    password: "123456",
    avatar: Faker::Avatar.image,
    nickname: Faker::Games::ElderScrolls.first_name,
    bio: Faker::Quote.matz,
    discord: "712233485753909319",
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

puts "Rival users"

puts "Creating 8 rival Users with proper Avatar"
days_times = []
days_times << random_start_end_time(rand(17..19), rand(20..23))
User.create(
  username: "Mucho",
  email: "mucho@1.com",
  password: 123456,
  nickname: "Mucho Beno",
  avatar: tenchu,
  bio: "Just look at my stats and start crying since you will never get as good as me.",
  discord: "invalid",
  role: role[0],
  server: "Tonberry",
  stats: 98,
  monday_start: days_times[0][0],
  monday_end: days_times[0][1],
  wednesday_start: days_times[0][0],
  wednesday_end: days_times[0][1],
  thursday_start: days_times[0][0],
  thursday_end: days_times[0][1],
  saturday_start: days_times[0][0],
  saturday_end: days_times[0][1]
)

User.create(
  username: "Lexar",
  email: "lexar@1.com",
  password: 123456,
  nickname: "Lexar Lunar",
  avatar: lumina,
  bio: "Just look at my stats and start crying since you will never get as good as me.",
  discord: "https://discord.gg/crazyLWT",
  role: role[1],
  server: "Tonberry",
  stats: 94,
  monday_start: days_times[0][0],
  monday_end: days_times[0][1],
  wednesday_start: days_times[0][0],
  wednesday_end: days_times[0][1],
  thursday_start: days_times[0][0],
  thursday_end: days_times[0][1],
  saturday_start: days_times[0][0],
  saturday_end: days_times[0][1]
)

User.create(
  username: "Rudis",
  email: "rudis@1.com",
  password: 123456,
  nickname: "Rudis Willo",
  avatar: alphi,
  bio: "Just look at my stats and start crying since you will never get as good as me.",
  discord: "https://discord.gg/crazyLWT",
  role: role[2],
  server: "Tonberry",
  stats: 78,
  monday_start: days_times[0][0],
  monday_end: days_times[0][1],
  wednesday_start: days_times[0][0],
  wednesday_end: days_times[0][1],
  thursday_start: days_times[0][0],
  thursday_end: days_times[0][1],
  saturday_start: days_times[0][0],
  saturday_end: days_times[0][1]
)

User.create(
  username: "Kuririn",
  email: "kuririn@1.com",
  password: 123456,
  nickname: "Kuririn Dragon",
  avatar: kiri,
  bio: "Just look at my stats and start crying since you will never get as good as me.",
  discord: "https://discord.gg/crazyLWT",
  role: role[2],
  server: "Tonberry",
  stats: 69,
  monday_start: days_times[0][0],
  monday_end: days_times[0][1],
  wednesday_start: days_times[0][0],
  wednesday_end: days_times[0][1],
  thursday_start: days_times[0][0],
  thursday_end: days_times[0][1],
  saturday_start: days_times[0][0],
  saturday_end: days_times[0][1]
)

User.create(
  username: "Lanze",
  email: "lanze@1.com",
  password: 123456,
  nickname: "Lanze Long",
  avatar: lucis,
  bio: "Just look at my stats and start crying since you will never get as good as me.",
  discord: "https://discord.gg/crazyLWT",
  role: role[1],
  server: "Tonberry",
  stats: 82,
  monday_start: days_times[0][0],
  monday_end: days_times[0][1],
  wednesday_start: days_times[0][0],
  wednesday_end: days_times[0][1],
  thursday_start: days_times[0][0],
  thursday_end: days_times[0][1],
  saturday_start: days_times[0][0],
  saturday_end: days_times[0][1]
)

User.create(
  username: "Miller",
  email: "miller@1.com",
  password: 123456,
  nickname: "Miller Jo",
  avatar: sille,
  bio: "Just look at my stats and start crying since you will never get as good as me.",
  discord: "https://discord.gg/crazyLWT",
  role: role[2],
  server: "Tonberry",
  stats: 72,
  monday_start: days_times[0][0],
  monday_end: days_times[0][1],
  wednesday_start: days_times[0][0],
  wednesday_end: days_times[0][1],
  thursday_start: days_times[0][0],
  thursday_end: days_times[0][1],
  saturday_start: days_times[0][0],
  saturday_end: days_times[0][1]
)

User.create(
  username: "Tokeo",
  email: "tokeo@1.com",
  password: 123456,
  nickname: "Tokeo Jerusalem",
  avatar: hanska,
  bio: "Just look at my stats and start crying since you will never get as good as me.",
  discord: "https://discord.gg/crazyLWT",
  role: role[2],
  server: "Tonberry",
  stats: 89,
  monday_start: days_times[0][0],
  monday_end: days_times[0][1],
  wednesday_start: days_times[0][0],
  wednesday_end: days_times[0][1],
  thursday_start: days_times[0][0],
  thursday_end: days_times[0][1],
  saturday_start: days_times[0][0],
  saturday_end: days_times[0][1]
)


puts "Creating Special Team"
pics = "https://hananon.com/wp-content/uploads/2018/05/hananon_avatar_round_500px.png"

status = [0, 1] # 0 is closed, 1 is open, 2 pending?
user_special2 = User.find_by(username: "Mucho")
Team.create(
  name: "Meme Breakers",
  avatar: pics,
  bio: "To the infinity and beyond!",
  discord: "wontwork",
  status: 1,
  user_id: user_special2.id,
  game_id: Game.last.id
)
team = Team.last
user_special2.update(team_id: team.id)


team_special2 = Team.last
user_10 = User.find_by(username: "Lexar")
user_11 = User.find_by(username: "Rudis")
user_12 = User.find_by(username: "Kuririn")
user_13 = User.find_by(username: "Lanze")
user_14 = User.find_by(username: "Miller")
user_15 = User.find_by(username: "Tokeo")

puts "seeding rival team with members"

if user_10.team_id.nil?
  Invite.create(
    status: 1,
    user: user_10,
    team: team_special2
  )
end

if user_11.team_id.nil?
  Invite.create(
    status: 1,
    user: user_11,
    team: team_special2
  )
end

if user_12.team_id.nil?
  Invite.create(
    status: 1,
    user: user_12,
    team: team_special2
  )
end

if user_13.team_id.nil?
  Invite.create(
    status: 1,
    user: user_13,
    team: team_special2
  )
end

if user_14.team_id.nil?
  Invite.create(
    status: 1,
    user: user_14,
    team: team_special2
  )
end

if user_15.team_id.nil?
  Invite.create(
    status: 1,
    user: user_15,
    team: team_special2
  )
end

puts "Creating events for special team2"

days_times_events = []
days_times_events << random_start_end_time(rand(8..21), rand(8..21))
day = 1..7
Event.create(
  name: content[3],
  description: Faker::Games::Overwatch.quote,
  day: rand(day),
  start_time: days_times_events[0][0],
  end_time: days_times_events[0][1],
  team_id: team_special2.id
)

Event.create(
  name: content[0],
  description: Faker::Games::Overwatch.quote,
  day: rand(day),
  start_time: days_times_events[0][0],
  end_time: days_times_events[0][1],
  team_id: team_special2.id
)

Event.create(
  name: content[2],
  description: Faker::Games::Overwatch.quote,
  day: rand(day),
  start_time: days_times_events[0][0],
  end_time: days_times_events[0][1],
  team_id: team_special2.id
)


puts "All finished"
