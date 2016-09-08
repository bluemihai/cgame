class User < ActiveRecord::Base
  enum role: [:player, :host, :admin]
  after_initialize :set_default_role, :if => :new_record?

  has_many :rsvps
  has_many :games, through: :rsvps

  scope :host_or_admin, -> { where('role > 0') }

  def facebook_url
    "http://facebook.com/#{facebook_id}"
  end

  def first_name
    name.split(' ').first
  end

  def first_last_initial
    names = name.split(' ')
    "#{names[0]} #{names[1][0]}."
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
