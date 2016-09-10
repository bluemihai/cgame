class Round < ApplicationRecord
  belongs_to :game
  has_many :groups
end
