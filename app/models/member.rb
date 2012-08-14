class Member < ActiveRecord::Base
  attr_accessible :first_name, :gtid, :last_name, :status

  has_many :attendances
  has_many :events, :through => :attendances
end
