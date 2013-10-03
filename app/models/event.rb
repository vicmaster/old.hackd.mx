# == Schema Information
#
# Table name: events
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  details       :text
#  user_id       :integer
#  latitude      :string(255)
#  longitude     :string(255)
#  location_name :string(255)
#  scheduled_at  :datetime
#  created_at    :datetime
#  updated_at    :datetime
#

class Event < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name, :user_id

  # Note: Make sure that this doesn't conflict with ActiveRecord
  attr_accessor :where
end
