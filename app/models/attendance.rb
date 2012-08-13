class Attendance < ActiveRecord::Base
  attr_accessible :event_id, :member_id, :status
end
