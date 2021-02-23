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
                  "https://pbs.twimg.com/media/EFhegNfWkAEBWi2.jpg:large" }

  validates :name, presence: true
  validates :description, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :day, presence: true
end
