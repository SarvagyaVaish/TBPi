class Member < ActiveRecord::Base
  attr_accessible :first_name, :gtid, :last_name, :role_id, :gtusername

  has_many :attendances, :dependent => :destroy
  has_many :events, :through => :attendances
  belongs_to :role

  def isWebmaster?
    begin
      return true if role.name == 'Webmaster'
    rescue
    end
    return false
  end

  def isOfficer?
    begin
      return true if role.name == 'Officer'
    rescue
    end
    return false
  end

end
