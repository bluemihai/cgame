class Round < ApplicationRecord
  belongs_to :game
  has_many :groups

  validates :order, presence: true, uniqueness: true

  def name
    "Round #{order} for #{game.name}"
  end
end
