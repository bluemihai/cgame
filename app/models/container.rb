class Container < ApplicationRecord
  belongs_to :location
  belongs_to :host, class_name: 'User'
  belongs_to :cohost, class_name: 'User', required: false
  has_many :games
  has_many :container_commitments
  has_many :users, through: :container_commitments

  after_save :update_related_games

  def update_related_games
    games.each do |game|
      week = ((game.starting - starting) / 1.week).to_i
      n = "#{name}, Week #{week}"
      games.update(
        host: host,
        cohost: cohost,
        location: location,
        name: n,
        users: users
      )
    end

  end

end
