class Event < ActiveRecord::Base
  validates_presence_of :name, :details, :user_id
end
