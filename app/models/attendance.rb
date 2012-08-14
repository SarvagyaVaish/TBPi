class Attendance < ActiveRecord::Base
  attr_accessible :event_id, :member_id, :status

  belongs_to :event
  belongs_to :member
end
