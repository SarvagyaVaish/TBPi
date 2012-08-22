class Member < ActiveRecord::Base
  attr_accessible :first_name, :gtid, :last_name, :role_id, :gtusername

  has_many :attendances, :dependent => :destroy
  has_many :events, :through => :attendances
  belongs_to :role
end
