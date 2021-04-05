class Event < ApplicationRecord
  belongs_to :team

  EVENT_IMAGE = { "The Sirensong Sea" =>
                  "https://i.ytimg.com/vi/rRISdYOQ5o0/maxresdefault.jpg",
                  "Amaurot" =>
                  "https://i.ytimg.com/vi/qok-U2Tsl-4/maxresdefault.jpg",
                  "The Dying Gasp" =>
                  "https://res.cloudinary.com/lmn/image/upload/c_limit,h_360,w_640/e_sharpen:100/f_auto,fl_lossy,q_auto/v1/gameskinnyc/h/o/w/how-get-new-mounts-ffxiv-24b73.PNG",
                  "Anamnesis Anyder" =>
                  "https://www.pcinvasion.com/wp-content/uploads/2020/02/Final-Fantasy-14-Anamnesis-Anyder-55-scaled.jpg",
                  "Mt. Gulg" =>
                  "https://pbs.twimg.com/media/EFhegNfWkAEBWi2.jpg:large",
                  "Void Ark" => "https://riikorinkoko.files.wordpress.com/2016/01/2015-11-11-void-ark-29.jpg?w=584",
                  "Dungeons (Endgame)" => "https://cdn.gamer-network.net/2014/usgamer/FFXIV-HalataliHard1.jpg/EG11/thumbnail/1920x1080/format/jpg/quality/65/final-fantasy-xiv-guide-complete-walkthrough-for-the-endgame-dungeons.jpg",
                  "The Weeping City of Mach" => "https://img2.finalfantasyxiv.com/accimg2/a2/9b/a29bbaeff6df6d42ac166e43cedb8d615445a438.jpg",
                  "Omega: Deltascape (Story)" => "https://res.cloudinary.com/lmn/image/upload/c_limit,h_392,w_696/e_sharpen:100/f_auto,fl_lossy,q_auto/v1/gameskinnyc/a/l/t/alte-roite-27c51.jpg",
                  "The Puppets' Bunker" => "https://attackofthefanboy.com/wp-content/uploads/2020/08/ffxiv-nier-puppets-bunker.jpg",
                  "Trials (Extreme)" => "https://img2.finalfantasyxiv.com/accimg2/d8/b3/d8b3c8b8c94cf5de1a8e37c3a21437651779d422.jpg",
                  "Trials ii (Extreme)" => "https://www.pcgamesn.com/wp-content/uploads/2019/07/ffxiv-titania-ex-guide-900x506.jpg",
                  "Alexander: Gordias (Savage)" => "https://i.ytimg.com/vi/x38etyxCWOQ/maxresdefault.jpg",
                  "Ultimates (Stormblood)" => "https://www.novacrystallis.com/wp-content/uploads/2018/06/FFXIV_PUB_Patch4_3_37-1024x576.png",
                  "Alexander: The Creator (Story)" => "https://static.wikia.nocookie.net/finalfantasy/images/c/cf/FFXIV_Alexander.png/revision/latest?cb=20150307115709",
                  "Alexander: Midas (Savage)" => "https://i.ytimg.com/vi/j1al8_k3st0/maxresdefault.jpg",
                  "Eden's Verse" => "https://www.pcinvasion.com/wp-content/uploads/2020/02/Final-Fantasy-XIV-Shiva-scaled-1200x720.jpg",
                  "The Unending Coil of Bahamut" => "https://images.mmorpg.com/images/heroes/features/12182.jpg",
                  "The Royal City of Rabanastre" => "https://mlpnk72yciwc.i.optimole.com/cqhiHLc.WqA8~2eefa/w:600/h:338/q:75/https://bleedingcool.com/wp-content/uploads/2017/10/FFXIV_Rabanastre_01.png",
                  "Eden's Gate" => "https://static.wikia.nocookie.net/finalfantasy/images/2/26/FFXIV_Voidwalker.png/revision/latest?cb=20190730003449",
                  "The Ridorana Lighthouse" => "https://res.cloudinary.com/lmn/image/upload/c_limit,h_360,w_640/e_sharpen:100/f_auto,fl_lossy,q_auto/v1/gameskinnyc/m/a/x/maxresdefault-3fec1.jpg",
                  "Omega: Sigmascape (Story)" => "https://cdn.mmos.com/wp-content/uploads/2018/01/final-fantasy-xiv-sigmascape.jpg",
                  "Omega: Sigmascape (Savage)" => "https://riikorinkoko2.files.wordpress.com/2019/03/2018-04-23-o8s-omega-raid-practise-02.jpg",
                  "The Orbonne Monastery" => "https://i2.wp.com/twinfinite.net/wp-content/uploads/2019/01/ffxiv-orbonne-monastery.jpg?fit=530%2C298&ssl=1",
                  "The Copied Factory" => "https://hardcore-gamer.s3.amazonaws.com/uploads/2019/10/FFXIV-NierBoss03.jpg",
                  "Eden's Promise" => "https://i.ytimg.com/vi/wmcBvcWZI9w/maxresdefault.jpg",
                  "Trials III (Extreme)" => "https://freetrial.finalfantasyxiv.com/na/img/dungeons_and_primals_bg-min.jpg",
                  "Trials (Unreal)" => "https://freetrial.finalfantasyxiv.com/na/img/dungeons_and_primals_bg-min.jpg",
                  "The Weapon's Refrain" => "https://saltedxiv.com/wp-content/uploads/2020/05/ffxiv_05092020_233844_297.jpg" }

  validates :name, presence: true
  validates :description, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :day, presence: true
end
