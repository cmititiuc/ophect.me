class ScheduledEvent < ActiveRecord::Base
  belongs_to :schedule
  belongs_to :event
  belongs_to :user
end
