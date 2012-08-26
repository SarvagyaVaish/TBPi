class Event < ActiveRecord::Base
  attr_accessible :end_dt, :event_type_id, :name, :semester_id, :start_dt, :default_points

  validates :semester_id, :presence => true

  belongs_to :semester
  belongs_to :event_type

  has_many :attendances, :dependent => :destroy
  has_many :members, :through => :attendances
end
