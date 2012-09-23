class Event < ActiveRecord::Base
  attr_accessible :end_dt, :event_type_id, :name, :semester_id, :start_dt, :default_points, :registerable

  validates :semester_id, :presence => true
  validates :default_points, :presence => true

  belongs_to :semester
  belongs_to :event_type

  has_many :attendances, :dependent => :destroy
  has_many :members, :through => :attendances

  def registered_members
    Attendance.where(:event_id => id, :status => "Registered")
  end

  def present_members
    Attendance.where(:event_id => id, :status => "Registered")
  end
end
