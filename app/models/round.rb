class Round < ApplicationRecord
  belongs_to :game
  has_many :groups

  validates :order, presence: true, uniqueness: { scope: :id,
    message: 'already created for this game'
  }

  def activities
    groups.map(&:activity)
  end

  def name
    "Round #{order} for #{game.safe_name}"
  end
end
