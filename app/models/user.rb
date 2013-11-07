class User < ActiveRecord::Base
  has_many :events

  def self.create_with_omniauth auth
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.email = auth['info']['email']
      user.name = auth['info']['name'] ||
                  auth['info']['nickname'] ||
                  'fellow Ruby on Rails enthusiast'
    end
  end
end
