class Group < ApplicationRecord
  belongs_to :round
  belongs_to :activity
  has_many :participations

  def game
    return nil if round.nil?
    round.game
  end

  def users
    return [] if game.nil?
    game.users.order(:name)
  end
end
