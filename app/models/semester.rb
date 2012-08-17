class Semester < ActiveRecord::Base
  attr_accessible :end_dt, :name, :start_dt

  has_many :events, :dependent => :destroy
end
