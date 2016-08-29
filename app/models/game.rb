class Game < ApplicationRecord
  belongs_to :location
  belongs_to :host, class_name: 'User'
  has_many :menu_items
  has_many :activities, through: :menu_items
end
