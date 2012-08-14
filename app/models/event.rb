class Event < ActiveRecord::Base
  attr_accessible :end, :event_type_id, :name, :semester_id, :start

  belongs_to :semester
  belongs_to :event_type

  has_many :attendances
  has_many :members, :through => :attendances
end
