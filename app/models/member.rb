class Member < ActiveRecord::Base
  attr_accessible :first_name, :gtid, :last_name, :status
end
