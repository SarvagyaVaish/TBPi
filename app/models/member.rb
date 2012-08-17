class Member < ActiveRecord::Base
  attr_accessible :first_name, :gtid, :last_name, :status

  has_many :attendances, :dependent => :destroy
  has_many :events, :through => :attendances
end
