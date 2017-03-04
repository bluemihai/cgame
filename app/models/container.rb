class Container < ApplicationRecord
  belongs_to :location
  belongs_to :host, class_name: 'User'
  belongs_to :cohost, class_name: 'User', required: false
  has_many :games
  has_many :container_commitments
  has_many :users, through: :container_commitments

  # after_create :create_related_games
  #
  # def create_related_games
  #   puts "Creating #{weeks} games...."
  #   (1..weeks).each do |week|
  #     s = starting + (week-1).weeks
  #     n = "#{name}, Week #{week}"
  #     games.create(host: host, cohost: cohost, location: location, starting: s, name: n)
  #   end
  # end
  #
end
