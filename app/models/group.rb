class Group < ApplicationRecord
  belongs_to :round
  belongs_to :activity
  has_many :participations
end
