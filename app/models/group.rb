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
end
