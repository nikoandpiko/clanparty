class Event < ApplicationRecord
  belongs_to :team

  validates :description, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :day, presence: true
end
