class Attendance < ActiveRecord::Base
  attr_accessible :event_id, :member_id, :status, :points

  belongs_to :event
  belongs_to :member
end
