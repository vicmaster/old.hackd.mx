class Event < ActiveRecord::Base
  validates_presence_of :name, :user_id

  # Note: Make sure that this doesn't conflict with ActiveRecord
  attr_accessor :where
end
