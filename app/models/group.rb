class Group < ApplicationRecord
  belongs_to :round
  belongs_to :activity, required: false
  has_many :participations
  has_many :participants, through: :participations, source: :user
  belongs_to :instigator, class_name: 'User', required: false

  def game
    return nil if round.nil?
    round.game
  end

  def starting
    return nil if game.nil?
    game.starting
  end

  def available_players
    other_groups_in_round = round.groups - [self]
    participants_in_other_groups_in_round = other_groups_in_round.map(&:participants).flatten
    game.players - participants_in_other_groups_in_round
  end

end
