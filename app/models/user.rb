class User < ActiveRecord::Base
  enum role: [:player, :host, :admin]
  after_initialize :set_default_role, :if => :new_record?

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
      end
    end
  end

end
