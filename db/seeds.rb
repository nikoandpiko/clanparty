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

logs_pics = ["https://img2.finalfantasyxiv.com/f/e668c247e191bceb03b523a66050377d_d384cf5ad7db803f29799f36ebbc3eadfc0_96x96.jpg?1607442113", "https://img2.finalfantasyxiv.com/f/9c09ef177e4572f66a1914cf9aa628ec_8f82f937943b6baf4c565020d5eba0ccfc0_96x96.jpg?1615127110", "https://img2.finalfantasyxiv.com/f/81d90cd4f96ccb5a8d91148542b7381b_b7a71d8799cf6dd75b711a7f52de6675fc0_96x96.jpg?1615157826", "https://img2.finalfantasyxiv.com/f/468e52fce40621506a3a4feae86b7e17_72c48f093f2278ac3243962d3eb6a8d7fc0_96x96.jpg?1601685057", "https://img2.finalfantasyxiv.com/f/da3b978069a994d1856be22b09f639d2_781d6b3603312f6be41670afa37282e0fc0_96x96.jpg?1607656334", "https://img2.finalfantasyxiv.com/f/717770e2dbcdb4e48af057740a5ed7fb_9eb3c19866f7ae0eeeffac7bf770aba5fc0_96x96.jpg?1614010693", "https://img2.finalfantasyxiv.com/f/284dd2e4652956475636177a723d6727_470db1bf2e865f9130531fea40b61ee4fc0_96x96.jpg?1612078627", "https://img2.finalfantasyxiv.com/f/b76aa67e9d59ec4032cd05aa57e273ba_7bb6b1e488f0e4f01c5314d010b60f31fc0_96x96.jpg?1614731543", "https://img2.finalfantasyxiv.com/f/4efb8d99723a90813969d583738b7aa8_a4730651230dd43cb129562a30d531aefc0_96x96.jpg?1615306742", "https://img2.finalfantasyxiv.com/f/6388e85a85d1d546c4cad7922798b373_ee738654add55c3d07ea92d8e108074cfc0_96x96.jpg?1614228226", "https://img2.finalfantasyxiv.com/f/f61ec185612a5bdb43568f4920b619bd_87b7d447f40b06dfc7228caf195f7dcffc0_96x96.jpg?1609499398", "https://img2.finalfantasyxiv.com/f/909592f9606b7513afaa050645a88ee1_9eb3c19866f7ae0eeeffac7bf770aba5fc0_96x96.jpg?1611472026", "https://img2.finalfantasyxiv.com/f/00b3fedb46bf541f74090a61b8635efb_3ea38e723c590aabf186367e1eb7e6a1fc0_96x96.jpg?1612170520", "https://img2.finalfantasyxiv.com/f/070e2b6249d781f46f8438fb73426029_7bb6b1e488f0e4f01c5314d010b60f31fc0_96x96.jpg?1615224415", "https://img2.finalfantasyxiv.com/f/34b9877cc26522e3086ee6e7753c80d4_9df1b3cb0da35db33c17ef11ddf12adafc0_96x96.jpg?1607788168", "https://img2.finalfantasyxiv.com/f/8e23607c6e191a1c126e6c0eefe3867a_ee738654add55c3d07ea92d8e108074cfc0_96x96.jpg?1615237709", "https://img2.finalfantasyxiv.com/f/5ea3a825635f884885225b76a70aee8c_138751880f18161a907d7cf0faa43f07fc0_96x96.jpg?1615022608", "https://img2.finalfantasyxiv.com/f/9ec03228d8a5674173c8daae4321b889_894c4bd0beab2e2beb44b74f4c4bd206fc0_96x96.jpg?1615094072", "https://img2.finalfantasyxiv.com/f/ba1a64531cc63a282fc3aef7b0034195_485f4777c38002871591fb54f27edc65fc0_96x96.jpg?1614773579", "https://img2.finalfantasyxiv.com/f/7fd26da68f9f87bb10682ba4cb5e8c3e_5047bc596a4bab2dc7f7c120bb22dec5fc0_96x96.jpg?1614892467", "https://img2.finalfantasyxiv.com/f/c7005b2ca01717df517ee295cf0c89b0_2e97c13fdd593d15d543093f8a37b6f0fc0_96x96.jpg?1614132384", "https://img2.finalfantasyxiv.com/f/93b731a6c7a4b39dd2de5669ac6a47c8_96ab1df8877c1f8ba6a89a39cccfd437fc0_96x96.jpg?1607143436", "https://img2.finalfantasyxiv.com/f/4a96a1130b168199216b1ed1b70c0968_87b7d447f40b06dfc7228caf195f7dcffc0_96x96.jpg?1574006706", "https://img2.finalfantasyxiv.com/f/c83880903376a13b247471894c1e8656_72c48f093f2278ac3243962d3eb6a8d7fc0_96x96.jpg?1602052262", "https://img2.finalfantasyxiv.com/f/d84cffdd36df6e2dee33c093f3f85f20_9eb3c19866f7ae0eeeffac7bf770aba5fc0_96x96.jpg?1611499861", "https://img2.finalfantasyxiv.com/f/e49d610dcb0d2663268556e64d2aa4e5_9df1b3cb0da35db33c17ef11ddf12adafc0_96x96.jpg?1615068029", "https://img2.finalfantasyxiv.com/f/87696a43fa0c97106901e333ecdcd5f5_87b7d447f40b06dfc7228caf195f7dcffc0_96x96.jpg?1615250588", "https://img2.finalfantasyxiv.com/f/01702bf3b6c6d2126a5b9162458944df_9f10d335198e90990f3437c5733468e7fc0_96x96.jpg?1615004436", "https://img2.finalfantasyxiv.com/f/b15ceb4f2fd0e91352f555f83fcc8818_393eb74047bb90c8d80dea54218430eefc0_96x96.jpg?1613675546", "https://img2.finalfantasyxiv.com/f/71322aad783b472961a2dc284fed3712_ce736afe35e2ded4e46c4fd0659aef7efc0_96x96.jpg?1615311052", "https://img2.finalfantasyxiv.com/f/902fd36b7abf52c56497a26785179348_0e336ff6ad415f47233f0aaf127feac0fc0_96x96.jpg?1615253780", "https://img2.finalfantasyxiv.com/f/927f2123b3ac4fe3e86a8e0b90f28c80_2f698530a28d671d20278c8518c804c9fc0_96x96.jpg?1614891757", "https://img2.finalfantasyxiv.com/f/b9edac6c71369438c0049f9abac61aa3_86da943caa70c8694707ab2ff74e68c9fc0_96x96.jpg?1614698221", "https://img2.finalfantasyxiv.com/f/df9a5efc1711338710c9f386fc8c4d20_53f1445a9f28799a32ea55f046319fc3fc0_96x96.jpg?1615300915", "https://img2.finalfantasyxiv.com/f/e42a237acbea302a5d4106d2b75b63d3_1f5fd239b885860b7c2bfc72ad1d97effc0_96x96.jpg?1615208571", "https://img2.finalfantasyxiv.com/f/1eac064a5040ebaff3759cfcee8fcd12_a4730651230dd43cb129562a30d531aefc0_96x96.jpg?1612844151", "https://img2.finalfantasyxiv.com/f/8d462ef88e2f0368cf1fc240cf46e1e0_485f4777c38002871591fb54f27edc65fc0_96x96.jpg?1610638574", "https://img2.finalfantasyxiv.com/f/da5fe5f914effab0333e0cc2ab8d2a10_e2bb3f9679fec6d4836fcf8abcc3eeacfc0_96x96.jpg?1615084554", "https://img2.finalfantasyxiv.com/f/e62e3c7f748dd2cc995668ee09ba20bd_c514cdcdb619439df97d906d4434ccc6fc0_96x96.jpg?1614796283", "https://img2.finalfantasyxiv.com/f/14216bc85b95f324b6b2db4bac5d67f8_40d57ba713628f3f1ef5ef204b6d76d2fc0_96x96.jpg?1614976172", "https://img2.finalfantasyxiv.com/f/4ebe55c9766b95e8bf92cdcc04265b2e_781d6b3603312f6be41670afa37282e0fc0_96x96.jpg?1615039088", "https://img2.finalfantasyxiv.com/f/eb29c7e6dd96408b3e97c5d3593aae3f_745baffc465480ed372e274d50318290fc0_96x96.jpg?1614872458", "https://img2.finalfantasyxiv.com/f/eb29c7e6dd96408b3e97c5d3593aae3f_745baffc465480ed372e274d50318290fc0_96x96.jpg?1614872458", "https://img2.finalfantasyxiv.com/f/49396a0ce69bc51cb58670c0f7547d06_ee738654add55c3d07ea92d8e108074cfc0_96x96.jpg?1615303254", "https://img2.finalfantasyxiv.com/f/348bfef54c0f461307cbc241ac46148b_e2bb3f9679fec6d4836fcf8abcc3eeacfc0_96x96.jpg?1615086342", "https://img2.finalfantasyxiv.com/f/44ce44490be4f31955c0dc63fb9dee44_39e25ac3d737c46452305eefe324372cfc0_96x96.jpg?1609850916", "https://img2.finalfantasyxiv.com/f/b024b0d1b7eaa042890816d709e1cdcf_a4730651230dd43cb129562a30d531aefc0_96x96.jpg?1615295496", "https://img2.finalfantasyxiv.com/f/843d6837f4742c7aba6985ca82bdcaa6_3ea38e723c590aabf186367e1eb7e6a1fc0_96x96.jpg?1615295278", "https://img2.finalfantasyxiv.com/f/837bfde9473dc11d80fb07f942832ac6_3fbff0e6b620e4d259dc427abc6574dafc0_96x96.jpg?1614725764", "https://img2.finalfantasyxiv.com/f/e62f4943d47f9c76d01b47c3412f8482_470db1bf2e865f9130531fea40b61ee4fc0_96x96.jpg?1610900434", "https://img2.finalfantasyxiv.com/f/3a0bb4f00b506c27556cd7e2bd4fa239_9df1b3cb0da35db33c17ef11ddf12adafc0_96x96.jpg?1615301302", "https://img2.finalfantasyxiv.com/f/de902ceddbf2900226a723331f2c5ad2_feaf0a2e88ff164813fbc9b85876fa48fc0_96x96.jpg?1615079983", "https://img2.finalfantasyxiv.com/f/ed9ad2ba09ce8129871b36202eacbd1c_e2bb3f9679fec6d4836fcf8abcc3eeacfc0_96x96.jpg?1614002026", "https://img2.finalfantasyxiv.com/f/923a11858d2ebff5d421c8ee6ae921f4_470db1bf2e865f9130531fea40b61ee4fc0_96x96.jpg?1615303715", "https://img2.finalfantasyxiv.com/f/09dd5c389a58f9bc33614c0f07135515_5047bc596a4bab2dc7f7c120bb22dec5fc0_96x96.jpg?1614182088", "https://img2.finalfantasyxiv.com/f/7595708377d9275324b8c913401cc72a_b937560c841465f7c4bc8eb47ea7948afc0_96x96.jpg?1614994805", "https://img2.finalfantasyxiv.com/f/824995e68acd740fb22d054be5a48741_b7a71d8799cf6dd75b711a7f52de6675fc0_96x96.jpg?1615305055", "https://img2.finalfantasyxiv.com/f/529e7682794e0c379fc4bc8b3aeb9155_8f82f937943b6baf4c565020d5eba0ccfc0_96x96.jpg?1615217855", "https://img2.finalfantasyxiv.com/f/4d828168025b5a42e0025f710c30d29b_470db1bf2e865f9130531fea40b61ee4fc0_96x96.jpg?1615293246", "https://img2.finalfantasyxiv.com/f/a9694e19ffb973daea00b60a1d43bdaa_134930215abb8a90ec37d6cc05b05e08fc0_96x96.jpg?1615304791"]

60.times do
  # valid start and end time
  # each weekday start and end time
  days_times = []
  7.times do
    days_times << random_start_end_time(rand(17..20), rand(20..23))
  end
  random_stats = rand(57..98)
  random_servers = ["Tonberry", "Ramuh", "Kujata", "Gungnir"]
  User.create(
    username: Faker::Games::Witcher.monster,
    email: "#{n+=1}@#{n+=1}.com",
    password: "123456",
    avatar: logs_pics.shuffle!.pop, #Faker::Avatar.image, #
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
    saturday_start: days_times[0][0],
    saturday_end: days_times[0][1],
    monday: true,
    tuesday: true,
    wednesday: true,
    thursday: true,
    friday: true,
    saturday: true,
    sunday: true,
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

team_names = ["Lost Shadows", "Organ Death Pipes", "CoronaKillerZ", "King Henry's widows", "Burpamore", "Sublimers", "RiseNdie"]
users_for_seed = User.all
7.times do
  status = [0, 1, 1] # 0 is closed, 1 is open, 2 pending?
  user = users_for_seed.sample
  Team.create(
    name: team_names.shuffle!.pop, #Faker::Games::StreetFighter.stage,
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
invites = Invite.all
40.times do
  user = users_for_seed.sample

  if user.team_id.nil? && invites.find_by(user_id: user.id).nil?
    Invite.create(
      status: 1,
      user: users_for_seed.sample,
      team: teams_for_seed.sample
    )
  end
end

puts "Creating pending Invites"
12.times do
  team_invite = teams_for_seed.sample
  user = users_for_seed.sample

  if user.team_id.nil? && team_invite.status == 1 && invites.find_by(user_id: user.id).nil?
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
  days_times_events << random_start_end_time(rand(17..19), rand(20..23))
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


# if user_7.team_id.nil?
#   Invite.create(
#     status: 2,
#     user: user_7,
#     team: team_special
#   )
# end

User.create(
  username: "Ludacris",
  email: "ludacris@1.com",
  password: 123456,
  nickname: "Ludacris Angmar",
  avatar: "https://img2.finalfantasyxiv.com/f/7603456cd0c0c02cba4cdc6474aaa97e_894c4bd0beab2e2beb44b74f4c4bd206fc0_96x96.jpg?1612878581",
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
days_times_events << random_start_end_time(rand(17..19), rand(20..23))
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
days_times_events << random_start_end_time(rand(17..19), rand(20..23))
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


# puts "All finished"
# sleep 2
# puts "Just kiding"
# sleep 1

puts "Creating 4 IT Geniuses"
# role = ["Rubyist"]
sat = []
# days_times << random_start_end_time(rand(17..17), rand(22..22))
tue_thu = []
tue_thu << random_start_end_time(19, 22)
sat << random_start_end_time(17, 23)
U

days_times_events = []
days_times_events << random_start_end_time(rand(17..19), rand(20..23))
day = 1..7

puts "Adding fflogs API"
require "uri"
require "net/http"
url = URI("https://www.fflogs.com/api/v2/client")
https = Net::HTTP.new(url.host, url.port)
https.use_ssl = true
request = Net::HTTP::Post.new(url)
request["Content-Type"] = "application/json"
fflogs_url = ENV["FFLOGS_KEY"]
request["Authorization"] = fflogs_url
request.body = "{\"query\":\"query {\\n  worldData {\\n    zones{\\n      name\\n    }\\n  }\\n}\",\"variables\":{}}"
response = https.request(request)
puts response.read_body

sleep 2


puts "all done"
