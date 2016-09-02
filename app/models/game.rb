class Game < ApplicationRecord
  before_create :randomize_id

  belongs_to :location
  belongs_to :host, class_name: 'User'

  has_many :menu_items
  has_many :activities, through: :menu_items

  has_many :rsvps
  has_many :users, through: :rsvps


  def self.upcoming
    select{ |game| game.starting > Time.zone.now }.sort_by(&:starting)
  end

  def self.past
    select{ |game| game.starting < Time.zone.now }.sort_by(&:starting)
  end

  private
    def randomize_id
      begin
        self.id = SecureRandom.random_number(1_000_000)
      end while Game.where(id: self.id).exists?
    end
end
