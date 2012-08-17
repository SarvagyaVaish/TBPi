class Attendance < ActiveRecord::Base
  attr_accessible :event_id, :member_id, :status, :points

  belongs_to :event
  belongs_to :member

  def self.sumOfPoints(memberId, eventTypeId, semesterId)
    points = 0
    Event.where(:semester_id => semesterId, :event_type_id => eventTypeId).each do |event|
      if Attendance.where(:event_id => event.id, :member_id => memberId, :status => "Present").count != 0
        points = points + Attendance.where(:event_id => event.id, :member_id => memberId, :status => "Present").first.points
      end
    end
    return points
  end

end
