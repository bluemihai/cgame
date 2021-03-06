require 'digest'

class User < ActiveRecord::Base
  enum role: [:player, :host, :admin]
  after_initialize :set_default_role, :if => :new_record?

  has_many :rsvps
  has_many :games, through: :rsvps
  has_many :container_commitments
  has_many :containers, through: :container_commitments
  has_many :participations

  validates :name, presence: true, uniqueness: true

  scope :host_or_admin, -> { where('role > 0').order(:name) }

  def groups
    games.map(&:groups).flatten
  end

  def add_to_group(grp_id)
    g = Group.find_by_id(grp_id)
    g.users << self unless g.nil?
    add_to_game(g.game.id)
    g
  end

  def add_to_game(gm_id)
    g = Game.find_by_id(gm_id)
    g.users << self unless g.nil?
    g
  end

  def gravatar(size = 24)
    gravatar_id = Digest::MD5.hexdigest(email.downcase) unless email.blank?
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=monsterid"
  end

  def facebook_avatar_url(size = 24)
    return "http://publicdomainvectors.org/photos/userMale.png" unless uid
    "http://graph.facebook.com/v2.8/#{uid}/picture?type=square"
  end

  def facebook_url
    "http://facebook.com/#{facebook_id}"
  end

  def first_name
    name.split(' ').first
  end

  def first_last_initial
    names = name.split(' ')
    "#{names[0]} #{names[1][0]}"
  end

  def set_default_role
    if User.count == 0
      self.role ||= :admin
    else
      self.role ||= :player
    end
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
        user.name = auth['info']['name'] || ""
        user.email = auth['info']['email'] || ""
      end
    end
  end

  def self.find_or_create_with_omniauth(auth)
    if existing = User.find_by(email: auth['info']['email'])
      existing.update(provider: auth['provider'], uid: auth['uid'])
      existing
    else
      create! do |user|
        user.provider = auth['provider']
        user.uid = auth['uid']
        if auth['info']
          user.name = auth['info']['name'] || ""
          user.email = auth['info']['email'] || ""
        end
      end
    end
  end

end
